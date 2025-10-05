//
//  InboxServiceProtocol.swift
//  
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public protocol ActionServiceProtocol {
    func action(request: ActionRequest) async throws -> ActionResponse?
}
public class ActionService: ActionServiceProtocol {
    public init() {}
    public func action(request: ActionRequest) async throws -> ActionResponse? {
        do {
            guard let url = URL(string: request.route + request.itemId) else {
                return ActionResponse()
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.dictionary
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            req.httpMethod = "POST"
            req.httpBody = try JSONEncoder().encode(request.params)
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                print("Inbox Action Response --> 204")
                return nil
            }
            if let InboxResponse = try? JSONDecoder().decode(ActionResponse.self, from: data) {
                print("Inbox Action Response --> 200")
                print(InboxResponse)
                return InboxResponse
            } else {
                print("Inbox Action Response --> Decode Error")
                return nil
            }
        } catch {
            print("Failed to Send POST Inbox Action Request \(error)")
            return nil
        }
    }
}
