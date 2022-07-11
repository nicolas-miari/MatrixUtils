import Foundation
import simd

// MARK: - Codable Support

extension simd_float4x4: Codable {

  public init(from decoder: Decoder) throws {
    var container = try decoder.unkeyedContainer()
    try self.init(container.decode([SIMD4<Float>].self))
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()
    try container.encode([columns.0,columns.1, columns.2, columns.3])
  }
}

// MARK: - Utilities

extension simd_float4x4 {

  public static let identity = matrix_identity_float4x4

  public init(scale: Float) {
    self.init(
      SIMD4(scale, 1, 1, 0),
      SIMD4(1, scale, 1, 0),
      SIMD4(1, 1, scale, 0),
      SIMD4(0, 0, 0, 1)
    )
  }

  // TODO: Add intializer for rotation, translation, orthogonal and perspective projection matrices.
}
