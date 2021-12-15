# ThinfinityJSROgetJSONdata
Testing the JSRO system trying to read data from the browser

There is a C# version at...<br>
https://github.com/gkoehn2020/ThinfinityJSROgetJSONdataSharp

Learn how to use JSRO at...<br>
https://www.cybelesoft.com/blog/windows-and-web-integration-through-thinfinity-jsro-javascript-remote-objects-introduction/     

<i>[2021-12-09] On Thinfinity VirtualUI version 3.0.7.103, the property in the Windows Application is always empty!</i><br>
<i>[2021-12-15] </i>Thinfinity VirtualUI version 3.0.7.108 fixed the issue.</i>

Delphi 10.4.<br>
Windows 10.<br>

<b>Requirement:</b>
  The windows application must serve the JSRO javascript.<br>
  The reason is, if we must change the JSRO javascript code for a new version of our Application,<br>
  we cannot be frequently changing the app.html file in C:\Program Files\Thinfinity\VirtualUI\web.<br>
  Our IT requires new versions of applications to be drop in replacements of our binaries.<br>
  We do not want modify code outside of our application directories.<br>

