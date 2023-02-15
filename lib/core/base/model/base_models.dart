mixin BaseResponse<T> {
  BaseResponse<T> onSuccess(void Function(T) block) {
    if (this is Success) block((this as Success).data);
    return this;
  }

  BaseResponse<T> onError(void Function(Exception) block) {
    if (this is Error) block((this as Error).exception);
    return this;
  }

  BaseResponse<T> onMessage(void Function(String) block) {
    if (this is Message) block((this as Message).message);
    return this;
  }
}

class Success<T> with BaseResponse<T> {
  T data;

  Success(this.data);
}

class Error<T> with BaseResponse<T> {
  Exception exception;

  Error(this.exception);
}

class Message<T> with BaseResponse<T> {
  String message;

  Message(this.message);
}
