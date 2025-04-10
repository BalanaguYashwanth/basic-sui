module nft::nft;

use std::string;
use sui::{url::{Self, Url}};

public struct NFT has key, store {
    id: UID,
    name: string::String,
    description: string::String,
    url: Url,
}

#[allow(lint(self_transfer))]
public fun mint_to_sender(
    name: vector<u8>,
    description: vector<u8>,
    url: vector<u8>,
    ctx: &mut TxContext,
) {
    let sender = ctx.sender();
    let nft = NFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        url: url::new_unsafe_from_bytes(url),
    };
    transfer::public_transfer(nft, sender);
}

