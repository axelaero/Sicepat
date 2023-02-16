Feature: Test Soal2

  Scenario: Script automation untuk URL https://jsonplaceholder.typicode.com/posts

    Given url 'https://jsonplaceholder.typicode.com/posts'
    And param limit = 10
    And param offset = 0
    When method get
    Then status 200
    And match response[0] == { id: '#number', title : '#string', body : '#string', userId: '#notnull'}

  Scenario: Script automation untuk URL https://jsonplaceholder.typicode.com/posts
    * def payload =
      """
      {"userId": 1, "id": 1, "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      },
      """

    Given url 'https://jsonplaceholder.typicode.com/posts'
    And request payload
    And method post
    Then status 201
    And match response == { id: '#number', title : '#string', body : '#string', userId: '#notnull'}
