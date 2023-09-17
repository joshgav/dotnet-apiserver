#! /usr/bin/env bash

this_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
root_dir=$(cd ${this_dir}/.. && pwd)
if [[ -e "${root_dir}/.env" ]]; then source ${root_dir}/.env; fi
if [[ -e "${this_dir}/.env" ]]; then source ${this_dir}/.env; fi

project_name=TodoApi

## generate a new project
dotnet new webapi --output ${this_dir} --name ${project_name}
dotnet add package Microsoft.EntityFrameworkCore.InMemory

## run project
dotnet run --launch-profile https

## for aspnet-codegenerator
dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design -v 7.0
dotnet add package Microsoft.EntityFrameworkCore.Design -v 7.0
dotnet add package Microsoft.EntityFrameworkCore.SqlServer -v 7.0

dotnet tool uninstall -g dotnet-aspnet-codegenerator
dotnet tool install -g dotnet-aspnet-codegenerator
dotnet tool update -g dotnet-aspnet-codegenerator

dotnet aspnet-codegenerator controller -name TodoItemsController -async -api -m TodoItem -dc TodoContext -outDir Controllers

dotnet remove package Microsoft.VisualStudio.Web.CodeGeneration.Design -v 7.0
dotnet remove package Microsoft.EntityFrameworkCore.Design -v 7.0
dotnet remove package Microsoft.EntityFrameworkCore.SqlServer -v 7.0

dotnet tool uninstall -g dotnet-aspnet-codegenerator