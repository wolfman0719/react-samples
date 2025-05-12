Class TEST.Broker Extends %CSP.REST
{

Parameter CONVERTINPUTSTREAM = 1;

Parameter HandleCorsRequest = 1;

XData UrlMap
{
<Routes>
  <Route Url="/upload" Method="POST" Call="TEST.Broker:upload"/>
</Routes>
}

ClassMethod upload() As %Status
{
  set sts=$$$OK

  try {
    if $data(%request) {
      set filename = %request.NextMimeData("")
      set upload = %request.MimeData(filename,1)
      set os=##class(%Stream.FileBinary).%New()
      set of = "/Users/hiroshisato/temp/"_filename
      set sts=os.LinkToFile(of)
      set sts = os.CopyFrom(upload)
      do os.%Save()
      set result = {}
      set result.filename = filename
      do result.%ToJSON()
    }
	  
  } catch ex {
    set sts=ex.AsStatus()
  }
  quit sts
}

}
