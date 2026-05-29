{ lib, ... }:
{
    plugins = {
        dap = {
            enable = true;
            configurations = {
                go = [
                ];
            };
        };

        dap-go = {
            enable = true;
        };
    };
} 
