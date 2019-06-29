package com.ru.waka

import com.amazonaws.services.lambda.runtime.Context

class Hello {
  def hello(x: Int, context: Context): java.util.List[String] = {
    println("Hello")
  }
}
