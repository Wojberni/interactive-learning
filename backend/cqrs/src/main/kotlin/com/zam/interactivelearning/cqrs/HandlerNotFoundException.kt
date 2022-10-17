package com.zam.interactivelearning.cqrs

class HandlerNotFoundException: RuntimeException {
    constructor(message: String): super(message)
    constructor(message: String, cause: Throwable): super(message, cause)
}