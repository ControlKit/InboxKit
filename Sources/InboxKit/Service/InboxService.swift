//
//  InboxServiceProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public protocol InboxServiceProtocol {
    func getInbox(request: InboxRequest) async throws -> InboxResponse?
}

public class InboxService: InboxServiceProtocol {
    public init() {}
    public func getInbox(request: InboxRequest) async throws -> InboxResponse? {
        do {
            guard let url = URL(string: request.route) else {
                return InboxResponse()
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.dictionary
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                print("Inbox Response --> 204")
                return nil
            }
            if let response = try? JSONDecoder().decode(InboxResponse.self, from: data) {
                print("Inbox Response --> 200")
                print(response)
                return response
            } else {
                print("Inbox Response --> Decode Error")
                return nil
            }
        } catch {
            print("Failed to Inbox Request \(error)")
            return nil
        }
    }
}
