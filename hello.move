module hello_world::hello_world {

    use std::string;

    public struct Hello has key, store {
        id: UID,
        text: string::String
    }

    public entry fun mint_hello_world(name: vector<u8>, ctx: &mut tx_context::TxContext) {
        let hello_object = Hello {
            id: object::new(ctx),
            text: string::utf8(name)
        };
        transfer::public_transfer(hello_object, tx_context::sender(ctx));
    }
}
