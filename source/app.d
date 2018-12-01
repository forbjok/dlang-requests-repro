import std.stdio : writeln;
import requests : getContent;

void main()
{
  writeln("BEFORE");

  auto content = getContent("http://httpbin.org/");
  writeln(content);

  writeln("AFTER");
}
