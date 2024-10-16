 IEEE Hackathon Workshop - Designing a REST API with Ballerina

## Introduction

This workshop will guide you through the process of creating a Ballerina REST API that will allow
you to create, read, update, and delete social media posts.

The Social media REST service exposes the following resources:

| Resource                       | Description                                        |
|--------------------------------|----------------------------------------------------|
| `GET api/posts`                | Get all the posts                                  |
| `GET api/posts/{id}`           | Get the post specified by the id                   |
| `POST api/post`                | Create a new post                                  |
| `DELETE api/posts/{id}`        | Delete the post specified by the id                |
| `GET api/posts/{id}/meta`      | Get the post specified by the id with the metadata |

This workshop has two sessions. In the first session, you will create a Ballerina social media
service which will use an in-memory table to store the posts. In the second session, you will
integrate a H2 database to store the posts.

The following diagram illustrates the architecture of the Social media REST service:

![Social media service](images/social-media-architecture.png)

## Areas covered

- Ballerina HTTP service
- Ballerina HTTP resource
- HTTP methods
- Path and query parameters
- Status code responses
- Request payload binding
- Data mapper
- Ballerina HTTP client
- HTTP generated client from OpenAPI specification
- Debugging the Ballerina service
- Integrating database

## Prerequisites

- [Install the latest Ballerina Swan Lake distribution](https://ballerina.io/downloads/)
- Set up [Visual Studio code](https://code.visualstudio.com/) by installing the [Ballerina extension](https://ballerina.io/learn/vs-code-extension/)

## Session 1 - Implementing a Ballerina REST service

1. Create a new Ballerina project.

    ```bash
    bal new social-media
    ```

2. Create a Ballerina HTTP service with the basepath: "/api".

   References:
   - [HTTP service and resource paths](https://ballerina.io/learn/by-example/http-service-and-resource-paths/)

3. Define a Ballerina record to represent the post. An example JSON object representing a post is
   as follows:

    ```json
    {
        "id": 1,
        "userId": 1,
        "description": "This is a post",
        "tags": "tag1, tag2",
        "category": "category1"
    }
    ```

    References:
    - [Records](https://ballerina.io/learn/by-example/records/)

4. Create an in-memory Ballerina table to store the posts. Use the `id` field as the key.

    References:
    - [Table](https://ballerina.io/learn/by-example/table/)

5. Populate the table with the following sample data:

    ```json
    {
        "id": 1,
        "userId": 1,
        "description": "Exploring Ballerina Language",
        "tags": "ballerina, programming, language",
        "category": "Technology"
    }
    ```

    ```json
    {
        "id": 2,
        "userId": 2,
        "description": "Introduction to Microservices",
        "tags": "microservices, architecture, introduction",
        "category": "Software Engineering"
    }
    ```

6. Implement the `GET api/posts` resource to retrieve all the posts. The response should have an
   array of posts.

   References:
   - [HTTP service and resource paths](https://ballerina.io/learn/by-example/http-service-and-resource-paths/)

7. Extend the `GET api/posts` resource by adding an optional query parameter `category`. If the
   `category` query parameter is provided, the resource should return only the posts that match the
   specified category.

    References:
    - [HTTP query parameter](https://ballerina.io/learn/by-example/http-query-parameter/)
    - [Nil type](https://ballerina.io/learn/by-example/nil/)

8. Implement the `GET api/posts/{id}` resource to retrieve a specific post by its `id`. The `id` is
   provided in the path. Return a `404 - Not Found` status code response if the post is not found.

    References:
    - [HTTP path parameter](https://ballerina.io/learn/by-example/http-path-param/)
    - [Send different status code responses](https://ballerina.io/learn/by-example/http-send-different-status-codes/)

9. Define a Ballerina record to represent the new post request payload. An example JSON object
   representing a new post is as follows:

    ```json
    {
        "userId": 1,
        "description": "This is a new post",
        "tags": "tag5, tag6",
        "category": "category3"
    }
    ```

10. Define a HTTP status code response record to represent a `201 - Created` response with the body
    as the post.

    References:
    - [Send different status code responses with payload](https://ballerina.io/learn/by-example/http-send-different-status-codes-with-payload/)

11. Implement the `POST api/post` resource to create a new post. The new post data is provided in
    the request payload. Return the status code response created in the previous step.

    References:
    - [Service payload binding](https://ballerina.io/learn/by-example/http-service-data-binding/)
    - [Send different status code responses with payload](https://ballerina.io/learn/by-example/http-send-different-status-codes-with-payload/)

12. Implement the `DELETE api/posts/{id}` resource to delete a specific post by its `id`. The `id`
    is provided in the path. Return a `204 - No Content` status code response.

13. Define a Ballerina record to represent the post with metadata. An example JSON object
    representing the post metadata is as follows:

    ```json
    {
        "id": 1,
        "userId": 1,
        "description": "This is a post",
        "meta": {
            "tags": ["tag1", "tag2"],
            "category": "category1"
        }
    }
    ```

14. Define a data-mapper function to convert a post to a post with metadata. The tags should be
    converted to an array by splitting with the comma.

    References:
    - [Data mapper](https://ballerina.io/learn/vs-code-extension/implement-the-code/data-mapper/)
    - [RegExp operations](https://ballerina.io/learn/by-example/regexp-operations/)

15. Implement the `GET api/posts/{id}/meta` resource to retrieve a specific post by its `id` with
    metadata. The `id` is provided in the path. Return a `404 - Not Found` status code response if
    the post is not found.

16. Define a Ballerina HTTP client to call the sentiment analysis service. The sentiment analysis
    service can be started by running the `sentiment-api` Ballerina project. The service will be
    started in the following URL: `http://localhost:9000/api`.

    References:
    - [HTTP client](https://ballerina.io/learn/by-example/http-client-send-request-receive-response/)

17. Define a Ballerina record to represent the sentiment analysis response. An example JSON object
    representing the sentiment analysis response is as follows:

    ```json
    {
        "label": "pos",
        "probability": {
            "neg": 0.30135019761690551,
            "neutral": 0.27119050546800266,
            "pos": 0.69864980238309449
        }
    }
    ```

18. Modify the `POST api/post` resource to validate the sentiment of the post by calling the
    sentiment analysis `POST` resource: `/sentiment` with the post description in the following
    format:

    ```json
    {
        "text": "Post description"
    }
    ```

    If the sentiment `label` is equals to `neg`, return a `400 - Bad Request` status
    code response.

    References:
    - [HTTP client](https://ballerina.io/learn/by-example/http-client-send-request-receive-response/)
    - [HTTP client data-binding](https://ballerina.io/learn/by-example/http-client-data-binding/)

19. Generate a sentiment analysis client using the OpenAPI specification given in the following
    path: `sentiment-api/sentiment_analysis_service.yaml`. Run the following command inside
    the `social-media` directory to generate the client:

    ```bash
    bal openapi -i ../sentiment-api/sentiment_analysis_service.yaml --mode client --single-file
    ```

    References:
    - [OpenAPI tool](https://ballerina.io/learn/openapi-tool/)

20. Replace the HTTP client with the generated client in the `POST api/post` resource.

21. Run the Ballerina service in debug mode and test the service.

    References:
    - [Debug Ballerina programs](https://ballerina.io/learn/debug-ballerina-programs/)

## Session 2 - Integrating a database

Replace the in-memory table with a SQL database to store the posts. Here, we will use the in-memory
H2 database. You can use any other databases(e.g., MySQL, PostgreSQL, MSSQL) by changing the
client initialization.

Import the following Ballerina modules to work with the H2 database:

```ballerina
import ballerina/sql;
import ballerinax/java.jdbc;
import ballerinax/h2.driver as _;
```

Use the following configurations for the datastore:

- URL: `jdbc:h2:<path-of-the-project>/databases/SOCIAL_MEDIA`
- Table name: `POSTS`
- Fields:
  - ID: INT, AUTO_INCREMENT
  - USER_ID: INT
  - DESCRIPTION: VARCHAR(255)
  - TAGS: VARCHAR(255)
  - CATEGORY: VARCHAR(255)

> **Note**: Create the table if it does not exist.

References:

- [Data access simple query](https://ballerina.io/learn/by-example/mysql-query-operation/)
- [Query with one result](https://ballerina.io/learn/by-example/mysql-query-row-operation/)
- [Query with advanced mapping](https://ballerina.io/learn/by-example/mysql-query-column-mapping/)
- [DML and DDL operations](https://ballerina.io/learn/by-example/mysql-execute-operation/)

> **Note**: Refer to [Ballerina persist](https://ballerina.io/learn/bal-persist-overview/) feature
> if you want more data persistence capabilities.
