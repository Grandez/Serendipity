function getTestData(sdpUrl) {
    tokens = sdpUrl.split("/");

    if (tokens.length == 1) return eval(tokens[0]);
    mod = tokens[1] % 3;
    return eval(tokens[0] + mod);
}