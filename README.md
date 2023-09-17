# dotnet-apiserver

- Build an API service in a container: `./deploy/build.sh`
- Deploy to K8s: `./deploy/deploy.sh`
- Test locally:
    ```bash
    docker run --rm -it -p 8080:8080 \
        -e ASPNETCORE_URLS="http://+:8080" \
        -e ASPNETCORE_HTTP_PORT=8080 \
        -e ASPNETCORE_ENVIRONMENT=Development \
        dotnet-apiserver:latest
    ```
- Or
    ```bash
    dotnet run
    ```

## .NET Resources

- https://dotnet.microsoft.com/download/dotnet/8.0
- https://learn.microsoft.com/en-us/aspnet/core/tutorials/first-web-api?view=aspnetcore-7.0&tabs=visual-studio-code
- https://learn.microsoft.com/en-us/aspnet/core/tutorials/first-mongo-app?view=aspnetcore-7.0&tabs=visual-studio-code
- Health Checks: https://learn.microsoft.com/en-us/aspnet/core/host-and-deploy/health-checks?view=aspnetcore-7.0
- List available project types: `dotnet new list`


