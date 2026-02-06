#!/usr/bin/env bash

echo "Installing ASPNET code generator"
dotnet tool install -g dotnet-aspnet-codegenerator
dotnet tool update -g dotnet-aspnet-codegenerator
echo "ASP.NET code generator installation complete"

echo "Ensuring application database exists"
CREATE_DATABASE_QUERY=<<EOF
SELECT 'CREATE DATABASE appdb'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'appdb')\gexec;
EOF
echo "$CREATE_DATABASE_QUERY" | psql -U postgres
echo "Database setup complete"
