import std.conv : text;
import std.stdio : writeln;
import requests : Request;

void main()
{
  writeln("BEFORE");

  auto url = "http://boards.4channel.org/g/thread/51971506";

  string[string] requestHeaders;

  requestHeaders["if-modified-since"] = "Fri, 07 Sep 2018 23:58:36 GMT";

  // Construct request
  auto request = Request();
  request.verbosity = 2;

  request.addHeaders(requestHeaders);

  // Execute request
  auto response = request.get(url);

  // If response indicates non-success, return without processing content
  if (response.code != 200)
    return;

  // Report progress
  writeln("RECEIVED " ~ text(response.contentReceived, " of ", response.contentLength));

  writeln("AFTER");
}
