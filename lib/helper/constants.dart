class Constants {
  static const String TODO_LIST_API_URL =
      'https://jsonplaceholder.typicode.com/todos';
  static const String USER_LIST_API_URL =
      'https://jsonplaceholder.typicode.com/users';

      static  Map<String, String> getDefaultHeaders() {
    return {
      'Content-type': 'application/json',
      'description': '',
    };
  }
}
