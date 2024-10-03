# Ballerina Libraries

Ballerina libraries provide a way to share reusable code across different Ballerina packages. This guide demonstrates how to create and share a library.

## Creating a New Library

To create a new Ballerina library, use the following command:

```bash
bal new -t lib <library-name>
```

## Sharing the Library

Once you've developed your library, you can share it with others by using the following commands:

- **`bal pack`**: Packages the library.
- **`bal push`**: Publishes the library to **Ballerina Central**, making it publicly available.

## Testing Locally with the Local Repository

If you want to test the library locally without pushing it to **Ballerina Central**, you can push it to your **local repository**, which is only available on your machine.

To push the library to the local repository, use:

```bash
$ bal push --repository local
```

### Using the Local Library

To include the library that you've pushed to the local repository in another project, add the following configuration to the `Ballerina.toml` file of that project:

```toml
[[dependency]]
org = "poorna"
name = "date_library"
version = "0.1.0"
repository = "local"
```

## Publishing a Package to Ballerina Central

1. Obtain an Access Token

    - Create an account on [Ballerina Central](https://central.ballerina.io/).
    - Navigate to the Dashboard to acquire your access token.
    - Place the `Settings.toml` file in your home repository (`<USER_HOME>/.ballerina/`), or if it exists, copy the access token into it:

        ```toml
        [central]
        accesstoken="<token>"
        ```

    - Alternatively, set the access token via the environment variable:

        ```bash
        export BALLERINA_CENTRAL_ACCESS_TOKEN="<token>"
        ```

2. Define the Organization

    - Ensure the `org` field in the `Ballerina.toml` file matches the organization you intend to push the package to. Rebuild the package if necessary.

3. Publish the Package

    Once ready, execute the following command to publish your package:

    ```bash
    $ bal push
    ```

For more information refer [here](https://ballerina.io/learn/publish-packages-to-ballerina-central/).
