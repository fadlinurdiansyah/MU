//
//  MUAPI.swift
//  MU
//
//  Created by fadielse on 11/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireNetworkActivityLogger
import Reachability

typealias SuccessResponse = (JSON?) -> Void
typealias ErrorResponse = (ErrorExceptionAPI) -> Void

class MUAPI {
    
    class Endpoint {
        
        #if PRODUCTION
        static let baseUrl = "LINK API PRODUCTION HERE"
        #else
        static let baseUrl = "https://api.muid.site"
        static let sportsDBUrl = "https://www.thesportsdb.com/api/v1/json/1/"
        static let localUrl = "http://192.168.0.4:80/muid/public/api/"
        #endif
    }
    
    static let instance = MUAPI()
    
    var alamoFireManager: SessionManager = SessionManager.default
    var req: Request?
    
    init() {
        #if DEBUG
        NetworkActivityLogger.shared.level = .debug
        #else
        NetworkActivityLogger.shared.level = .off
        #endif
        self.setAFconfig()
    }
    
    func setAFconfig() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // seconds
        configuration.timeoutIntervalForResource = 30
        self.alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func flushBeforeRequest(_ request: URLRequestConvertible,
                            success:@escaping SuccessResponse,
                            exception:@escaping ErrorResponse) {
        alamoFireManager.session.flush { }
        alamoFireManager.session.getAllTasks(completionHandler: { (task) in
            task.forEach { $0.cancel() }
        })
        self.request(request, success: success, exception: exception)
    }
    
    func request(_ request: URLRequestConvertible,
                 success:@escaping SuccessResponse,
                 exception:@escaping ErrorResponse) {
        #if DEBUG
        NetworkActivityLogger.shared.startLogging()
        #endif
        req = alamoFireManager.request(request).responseJSON { response in
            guard case let .failure(error) = response.result else {
                self.handleDataResponse(response: response, success: success, exception: exception)
                self.invalidateAndConfigure()
                return
            }
            self.throwExceptionError(error: error, exception: exception)
            self.invalidateAndConfigure()
        }
    }
    
    func uploadImage(_ request: URLRequestConvertible,
                     multipartFormData: @escaping (MultipartFormData) -> Void,
                     success: @escaping SuccessResponse,
                     exception:@escaping ErrorResponse) {
        #if DEBUG
        NetworkActivityLogger.shared.startLogging()
        #endif
        alamoFireManager.upload(multipartFormData: multipartFormData, with: request) { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    self.handleDataResponse(response: response, success: success, exception: exception)
                }
            case .failure(let error):
                self.throwExceptionError(error: error, exception: exception)
            }
            self.invalidateAndConfigure()
        }
    }
    
    func downloadImage(withRequest request: URLRequestConvertible,
                       filename: String,
                       success:@escaping SuccessResponse,
                       exception:@escaping ErrorResponse) {
        #if DEBUG
        NetworkActivityLogger.shared.startLogging()
        #endif
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            documentsURL.appendPathComponent(filename)
            return (documentsURL, [.removePreviousFile])
        }
        
        alamoFireManager.download(request, to: destination).responseData { response in
            if let error = response.error {
                self.throwExceptionError(error: error, exception: exception)
            } else {
                if let destinationUrl = response.destinationURL {
                    #if DEBUG
                    print("destinationUrl \(destinationUrl.absoluteURL)")
                    #endif
                    let data = JSON(["destinationUrl": destinationUrl.absoluteURL])
                    success(data)
                }
            }
            self.invalidateAndConfigure()
        }
    }
    
    func invalidateAndConfigure() {
        #if DEBUG
        NetworkActivityLogger.shared.stopLogging()
        #endif
        self.alamoFireManager.session.finishTasksAndInvalidate()
        self.setAFconfig()
    }
    
    private func handleDataResponse(response: DataResponse<Any>,
                                    success: @escaping SuccessResponse,
                                    exception:@escaping ErrorResponse) {
        
        if let value = response.result.value {
            let jsonValue = JSON(value)
            let baseApi = BaseDAO(json: jsonValue)
            if baseApi.isError() {
                if let errorException = baseApi.error {
                    exception(errorException)
                } else {
                    checkErrorResponse(exception: exception)
                }
            } else {
                success(jsonValue)
            }
        } else {
            checkErrorResponse(exception: exception)
        }
    }
    
    private func checkErrorResponse(exceptionError error: ErrorExceptionAPI? = nil, exception:@escaping ErrorResponse) {
        if let reachability = Reachability() {
            switch reachability.connection {
            case .none:
                exception(NoInternetConnectionException())
            default:
                if let error = error {
                    exception(error)
                } else {
                    exception(InternalServerErrorException())
                }
            }
        }
    }
    
    private func throwExceptionError(error: Error, exception: @escaping ErrorResponse) {
        if let error = error as? AFError {
            switch error {
            case .invalidURL(let url):
                #if DEBUG
                print("Invalid URL: \(url) - \(error.localizedDescription)")
                #endif
            case .parameterEncodingFailed(let reason):
                #if DEBUG
                print("Parameter encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
            case .multipartEncodingFailed(let reason):
                #if DEBUG
                print("Multipart encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
            case .responseValidationFailed(let reason):
                #if DEBUG
                print("Response validation failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
                
                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                    #if DEBUG
                    print("Downloaded file could not be read")
                    #endif
                case .missingContentType(let acceptableContentTypes):
                    #if DEBUG
                    print("Content Type Missing: \(acceptableContentTypes)")
                    #endif
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    #if DEBUG
                    print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                    #endif
                case .unacceptableStatusCode(let code):
                    #if DEBUG
                    print("Response status code was unacceptable: \(code)")
                    #endif
                }
            case .responseSerializationFailed(let reason):
                #if DEBUG
                print("Response serialization failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
                #endif
            }
            #if DEBUG
            print("Underlying error: \(String(describing: error.underlyingError))")
            #endif
        } else if let error = error as? URLError {
            #if DEBUG
            print("URLError occurred: \(error)")
            #endif
            checkErrorResponse(exceptionError: TaskCancelErrorException(error: error), exception: exception)
            return
        } else {
            #if DEBUG
            print("Unknown error: \(String(describing: error))")
            #endif
        }
        
        checkErrorResponse(exception: exception)
    }
}

class NoInternetConnectionException: ErrorExceptionAPI {
    
    init() {
        super.init()
        code = 404
        title = "Tidak ada koneksi internet"
        reason = nil
        message = "Mohon periksa kembali koneksi internetmu untuk memuat halaman"
        type = ErrorExceptionAPI.TypeValue.noInternetConnection
    }
}

class InternalServerErrorException: ErrorExceptionAPI {
    
    init() {
        super.init()
        code = 500
        title = "Sistem Sibuk"
        reason = nil
        message = "Maaf, Server kami sedang sibuk saat ini. Kami akan kembali beberapa saat lagi"
        type = ErrorExceptionAPI.TypeValue.internetServerError
    }
}

class TaskCancelErrorException: ErrorExceptionAPI {
    
    init(error: URLError) {
        super.init()
        code = error.errorCode
        title = error.localizedDescription
        reason = nil
        message = error.localizedDescription
        type = error.localizedDescription
    }
}
