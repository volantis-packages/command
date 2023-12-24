class CommandDefinitionBase {
    CommandId := ""
    PositionalArguments := []
    NamedArguments := Map()

    __New(args) {
        this._ParseArgs(args)
    }

    _ParseArgs(args) {
        this.NamedArguments := Map()
        this.PositionalArguments := []

        for index, arg in args {
            if (index == 1) {
                this.CommandId := arg
                continue
            }

            parts := StrSplit(arg, "=",, 2)

            if (parts.Length > 1) {
                this.NamedArguments[parts[1]] = parts[2]
            } else {
                this.PositionalArguments.Push(arg)
            }
        }
    }

    GetCommandId() {
        return this.CommandId
    }

    GetArgument(argumentName) {
        argumentValue := ""

        if (IsNumber(argumentName)) {
            if (argumentName <= this.PositionalArguments.Length) {
                argumentValue := this.PositionalArguments[argumentName]
            }
        } else {
            if (this.NamedArguments.Has(argumentName)) {
                argumentValue := this.NamedArguments[argumentName]
            }
        }

        return argumentValue
    }
}
