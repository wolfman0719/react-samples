Class TEST.Setup Extends %Base
{

ClassMethod SetupLocal(pDir As %String) As %Status
{
  set status = $$$OK
  set os = $system.Version.GetOS()
  
  if os = "Windows" {
    set delim = "\"
  }
  else {
    set delim = "/"
  }

  set namespace = $namespace
  set $namespace = "%SYS"
  set sec = ##class("Security.Applications").%New()
  set sec.Name = "/api/upload"
  set sec.NameSpace = namespace
  set sec.DispatchClass ="TEST.Broker"
  set sec.AutheEnabled = 96
  set status = sec.%Save()
  set $namespace = namespace

  Do $system.OBJ.ImportDir(pDir_delim_"src",,"ck",,1)
  quit status
}

}

