class CommandBase {
    _definition := ""

    __New(definition) {
        this._definition = definition
    }

    GetDefinition() {
        return this._definition
    }

    Execute() {

    }
}
