# API 接點

## 技術工具
- .NET 5 SDK
  ```
  # 在 Ubuntu 用 asdf 安裝 dotnet
  $ echo -e \\ndotnet-core 5.0.300 >> ~/.tool-versions
  $ asdf plugin add dotnet-core
  $ asdf install dotnet-core
  ```
- 本專案是 .NET web API 專案。
  程式專案啟動資訊是 `dotnet new webapi --project endpoint --output .` ，請見[微軟提供的說明書](https://docs.microsoft.com/zh-tw/dotnet/core/tools/dotnet-new)
- 執行方式：
  ```
  $ dotnet run .
  ```
  程式會啟動 server 並印出下列資訊，
  ```
  info: Microsoft.Hosting.Lifetime[0]
      Now listening on: https://localhost:5001
  info: Microsoft.Hosting.Lifetime[0]
      Now listening on: http://localhost:5000
  ```
- HTTP 客戶端，建議使用 [Insomnia](https://insomnia.rest/download) 。
  開發階段可將 Insomnia 的設定項目 `Settings > General > [x] "Validate certificates"` 解除勾選。
  等部署時，才接著解決 SSL certificate 的問題。
- 本專案內定有 Swagger 文件，位於 `https://localhost:5001/swagger/`：在瀏覽器開啟此網址以瀏覽。
