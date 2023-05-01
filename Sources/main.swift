// The Swift Programming Language
// https://docs.swift.org/swift-book

import Octokit
import SwiftMIDIPlayer

let owner = "octokit"
let repo = "octokit.swift"
let filename = "test.mid"

let client = Octokit()
client.repos.get(owner: owner, repo: repo) { result in
    switch result {
    case .success(let repository):
        print("Repository: \(repository.fullName)")
        let contentsURL = repository.contentsURL
        let contentsPath = contentsURL.replacingOccurrences(of: "{+path}", with: "")
        client.contents.get(atPath: filename, from: contentsPath, owner: owner, repo: repo) { result in
            switch result {
            case .success(let content):
                guard let data = Data(base64Encoded: content.content) else { return }
                let player = MIDIPlayer(data: data)
                player.play()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    case .failure(let error):
        print(error.localizedDescription)
    }
}

RunLoop.main.run()

