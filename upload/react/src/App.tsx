import React, { useState } from "react"
import axios, { AxiosError } from "axios"
import configinfo from './serverconfig.json';

const serverAddress = configinfo.ServerAddress;
const serverPort = configinfo.ServerPort;
const username = configinfo.Username;
const password = configinfo.Password;
const applicationName = configinfo.ApplicationName;

export const App = (): JSX.Element => {
  const [file, setFile] = useState<File | null>(null)
  const [fileName, setFileName] = useState<any>("")

  const onChangeFile = (e: React.ChangeEvent<HTMLInputElement>) => {
  const files = e.target.files
  
   if (files && files[0]) {
      setFile(files[0])
      setFileName(files[0].name)
    }
  }

  const onClickSubmit = async () => {
    if (!file) {
      return
    }
    const formData = new FormData()
    
    const url = `http://${serverAddress}:${serverPort}/${applicationName}`;
    
    formData.append(fileName, file)

    await axios.post(`${url}`, formData)
      .then((res) => {
        console.log(res.data)
      })
      .catch((e: AxiosError) => {
        console.dir(e)
      })
    }
    
  return (
    <div className="App">
      <div className="App-form">
        <input
          name={fileName}
          type="file"
          accept="image/*"
          onChange={onChangeFile}
        />
        <input type="button" disabled={!file} value="送信" onClick={onClickSubmit} />
      </div>
    </div>
  )
}

export default App;
