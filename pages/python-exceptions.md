- ```python
  def exception_handler(exception_type, exception, traceback):
      # All your trace are belong to us!
      # your format
      print "%s: %s" % (exception_type.__name__, exception)
  
  sys.excepthook = exception_handler
  ```
-