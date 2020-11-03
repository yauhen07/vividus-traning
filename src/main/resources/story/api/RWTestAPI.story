Description: Test reqres.in API

Scenario: Health check
When I issue a HTTP GET request for a resource with the URL 'https://reqres.in/api/users?page=2'
Then `${responseCode}` is equal to `200`

Scenario: Create user
Given request body: {
                        "name": "yauhen",
                        "job": "leader"
                    }
When I issue a HTTP POST request for a resource with the URL 'https://reqres.in/api/users'
When I save JSON element from context by JSON path `$.id` to STORY variable `id`
Then `${responseCode}` is equal to `201`
Then `${id}` matches `"(\d{1,})"`
