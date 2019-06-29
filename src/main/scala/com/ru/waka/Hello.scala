package com.ru.waka

import scala.collection.JavaConverters._
import com.amazonaws.services.lambda.runtime.Context

class Hello {
  def hello(input: Any, context: Context): java.util.List[String] = {
    val logger = context.getLogger
    logger.log("Hello")
    logger.log(input.toString)
    logger.log(context.getFunctionName)
    Nil.asJava
  }
}
