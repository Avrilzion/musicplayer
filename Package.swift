// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "musicplayer",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "musicplayer",
            path: "Sources"),
    ]
)

// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "GitHubMusicPlayer",
    dependencies: [
        .package(url: "https://github.com/octokit/octokit.swift", from: "0.11.0"),
        .package(url: "https://github.com/Swift-AI/Swift-MIDI-Player", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "GitHubMusicPlayer",
            dependencies: ["Octokit", "SwiftMIDIPlayer"]),
    ]
)

