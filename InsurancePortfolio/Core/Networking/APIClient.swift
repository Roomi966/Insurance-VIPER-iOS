import Foundation
enum APIClientError: Error { case invalidResponse, badStatus(Int), decoding(Error) }
protocol APIClientProtocol { func request<T: Decodable>(_ request: URLRequest, as type: T.Type) async throws -> T }
final class APIClient: APIClientProtocol {
    private let session: URLSession
    init(session: URLSession = .shared) { self.session = session }
    func request<T: Decodable>(_ request: URLRequest, as type: T.Type) async throws -> T {
        let (data,response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse else { throw APIClientError.invalidResponse }
        guard 200..<300 ~= http.statusCode else { throw APIClientError.badStatus(http.statusCode) }
        do { return try JSONDecoder().decode(T.self, from: data) } catch { throw APIClientError.decoding(error) }
    }
}
