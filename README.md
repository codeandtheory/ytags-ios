![Y—Tags](https://user-images.githubusercontent.com/1037520/220168883-0452b4bb-bd1c-41cd-b29f-207eb93fa25b.jpeg)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fyml-org%2Fytags-ios%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/yml-org/ytags-ios) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fyml-org%2Fytags-ios%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/yml-org/ytags-ios)  
_Accessible and customizable tag user interface elements for iOS._

This framework includes tag components (some times referred to as pills) that are fully customizable and support Dynamic Type and the Accessibility Bold Text feature (tag borders also become bold together with text). The default appearance supports Dark Mode and is WCAG 2.00 AAA compliant (when specifying custom colors it is up to the caller to provide support for Dark and Increased Contrast Modes).

![Y—Tags demo animation](https://user-images.githubusercontent.com/1037520/224697264-6ffb00fb-1ab7-47a0-963f-357da96e37d3.gif)

Licensing
----------
Y—Tags is licensed under the [Apache 2.0 license](LICENSE).

Documentation
----------

Documentation is automatically generated from source code comments and rendered as a static website hosted via GitHub Pages at: https://yml-org.github.io/ytags-ios/

Usage
----------

![Tag view Components](https://user-images.githubusercontent.com/1037520/224698467-b479aed5-ad96-49fe-8a09-c23308c4b346.jpeg)

### Initializers
Tag view can be initialized with a title and an appearance(optional). The appearance parameter allows you to fully customize the tag (including whether it includes a leading icon and/or a trailing close button). You can also update the tag’s appearance at any time.

```swift
public init(
    title: String,
    appearance: TagView.Appearance = .default
)
```

#### Simple use case 1: Text only tag with default appearance.

```swift
let tagView = TagView(title: "Hello World!!")
```

#### Simple use case 2: Text only tag with custom appearance.

```swift
let tagView = TagView(
    title: "Hello world!",
    appearance: TagView.Appearance(
        backgroundColor: .blue,
        borderColor: .black,
        shape: .rectangle
    )
)
```

#### Simple use case 3: Tag with icon.

```swift
let tagView = TagView(
    title: "Hello world!",
    appearance: TagView.Appearance(
        icon: TagView.Appearance.LeadingIcon(image: cube)
    )
)
```

#### Simple use case 4: Tag with close button.

```swift
let tagView = TagView(
    title: "Hello world!",
    appearance: TagView.Appearance(
        closeButton: TagView.Appearance.CloseButton()
    )
)
```

### Customization
`TagView` has an `appearance` property of type `Appearance`.

`Appearance` lets you customize the tag view appearance. We can customize the appearance of the border color, leading icon, close icon, background color etc.

```swift
public struct Appearance {
    /// A tuple consisting of `textColor` and `typography` for the title label.
    /// Default is `(.label, .systemLabel)`.
    public var title: (textColor: UIColor, typography: Typography)
    /// Tag view background color. Default is `.clear`.
    public var backgroundColor: UIColor
    /// Border color. Default is `.label`.
    public var borderColor: UIColor
    /// border width. Default is `1`.
    public var borderWidth: CGFloat
    /// Leading icon appearance. Default is 'nil` (no leading icon).
    public var icon: LeadingIcon?
    /// Close button appearance. Default is 'nil` (no close button).
    public var closeButton: CloseButton?
    /// Tag view layout properties such as spacing between views. Default is `.default`.
    public var layout: Layout
    /// Tag shape. Default is `.capsule`.
    public var shape: Shape
    /// Whether a leading icon is present or not.
    var hasIcon: Bool { icon != nil }
    /// Whether a close button is present or not.
    var hasCloseButton: Bool { closeButton != nil }
}
```

**Update or customize appearance**

```swift
// Declare a tag view.
let tagView = TagView(title: "Hello World!!")

// Change background color, border color, shape, text color, and typography.
tagView.appearance.backgroundColor = .red
tagView.appearance.borderColor = .black
tagView.appearance.shape = .rectangle
tagView.appearance.title =  (.secondaryLabel, .smallSystem)
```

Dependencies
----------

Y—Tags depends upon our [Y—CoreUI](https://github.com/yml-org/ycoreui) and [Y—MatterType](https://github.com/yml-org/ymattertype) frameworks (both also open source and Apache 2.0 licensed).

Installation
----------

You can add Y—Tags to an Xcode project by adding it as a package dependency.

1. From the **File** menu, select **Add Packages...**
2. Enter "[https://github.com/yml-org/ytags-ios](https://github.com/yml-org/ytags-ios)" into the package repository URL text field
3. Click **Add Package**

Contributing to Y—Tags
----------

### Requirements

#### SwiftLint (linter)
```
brew install swiftlint
```

#### Jazzy (documentation)
```
sudo gem install jazzy
```

### Setup

Clone the repo and open `Package.swift` in Xcode.

### Versioning strategy

We utilize [semantic versioning](https://semver.org).

```
{major}.{minor}.{patch}
```

e.g.

```
1.0.5
```

### Branching strategy

We utilize a simplified branching strategy for our frameworks.

* main (and development) branch is `main`
* both feature (and bugfix) branches branch off of `main`
* feature (and bugfix) branches are merged back into `main` as they are completed and approved.
* `main` gets tagged with an updated version # for each release
 
### Branch naming conventions:

```
feature/{ticket-number}-{short-description}
bugfix/{ticket-number}-{short-description}
```
e.g.
```
feature/CM-44-button
bugfix/CM-236-textview-color
```

### Pull Requests

Prior to submitting a pull request you should:

1. Compile and ensure there are no warnings and no errors.
2. Run all unit tests and confirm that everything passes.
3. Check unit test coverage and confirm that all new / modified code is fully covered.
4. Run `swiftlint` from the command line and confirm that there are no violations.
5. Run `jazzy` from the command line and confirm that you have 100% documentation coverage.
6. Consider using `git rebase -i HEAD~{commit-count}` to squash your last {commit-count} commits together into functional chunks.
7. If HEAD of the parent branch (typically `main`) has been updated since you created your branch, use `git rebase main` to rebase your branch.
    * _Never_ merge the parent branch into your branch.
    * _Always_ rebase your branch off of the parent branch.

When submitting a pull request:

* Use the [provided pull request template](.github/pull_request_template.md) and populate the Introduction, Purpose, and Scope fields at a minimum.
* If you're submitting before and after screenshots, movies, or GIF's, enter them in a two-column table so that they can be viewed side-by-side.

When merging a pull request:

* Make sure the branch is rebased (not merged) off of the latest HEAD from the parent branch. This keeps our git history easy to read and understand.
* Make sure the branch is deleted upon merge (should be automatic).

### Releasing new versions
* Tag the corresponding commit with the new version (e.g. `1.0.5`)
* Push the local tag to remote

Generating Documentation (via Jazzy)
----------

You can generate your own local set of documentation directly from the source code using the following command from Terminal:
```
jazzy
```
This generates a set of documentation under `/docs`. The default configuration is set in the default config file `.jazzy.yaml` file.

To view additional documentation options type:
```
jazzy --help
```
A GitHub Action automatically runs each time a commit is pushed to `main` that runs Jazzy to generate the documentation for our GitHub page at: https://yml-org.github.io/ytags-ios/
