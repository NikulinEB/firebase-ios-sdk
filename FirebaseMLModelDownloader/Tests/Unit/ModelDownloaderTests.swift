// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import XCTest
@testable import FirebaseMLModelDownloader

final class ModelDownloaderTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    let modelDownloader = ModelDownloader()
    let conditions = ModelDownloadConditions()

    // Download model w/ progress handler
    modelDownloader.getModel(
      name: "your_model_name",
      downloadType: .latestModel,
      conditions: conditions,
      progressHandler: { progress in
        // Handle progress
      }
    ) { result in
      switch result {
      case let .success(customModel): break
      // Use model with your inference API
      // let interpreter = Interpreter(modelPath: customModel.modelPath)
      case let .failure(error): break
        // Handle download error
      }
    }

    // Access array of downloaded models
    modelDownloader.listDownloadedModels { result in
      switch result {
      case let .success(customModels):
        for model in customModels {
          // Pick model(s) for further use
        }
      case let .failure(error): break
        // Handle failure
      }
    }

    // Delete downloaded model
    modelDownloader.deleteDownloadedModel(name: "your_model_name") { result in
      switch result {
      case .success(): break
      // Apply any other clean up
      case let .failure(error): break
        // Handle failure
      }
    }
  }
}