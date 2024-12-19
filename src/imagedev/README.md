
# Image Development (imagedev)

Tooling for embedded Linux image development.

## Example Usage

```json
"features": {
    "ghcr.io/GreyBeagleLinux/image-dev-features/imagedev:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| build_tools_repo | Select the repository which provides the build tools. | string | https://github.com/GreyBeagleLinux/build_tools |
| build_tools_version | Branch or tag of the build tools. | string | gbl_main |
| embdgen_repo | Select the repository which provides embdgen. | string | https://github.com/GreyBeagleLinux/embdgen |
| embdgen_version | Branch or tag of embdgen. | string | master |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/GreyBeagleLinux/image-dev-features/blob/main/src/imagedev/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
