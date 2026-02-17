import bcrypt from "bcryptjs";

export const handler = async (event) => {
    let password;
    try {
        const body = JSON.parse(event.body || '{}');
        password = body.password;
    } catch (error) {
        return {
            statusCode: 400,
            body: JSON.stringify({ error: "Invalid JSON in request body" })
        };
    }
    
    if (!password) {
        return {
            statusCode: 400,
            body: JSON.stringify({ error: "Password is required" })
        };
    }

    const numSaltRounds = 8;
    const hashedPassword = await bcrypt.hash(password, numSaltRounds);

    const response = {
        statusCode: 200,
        body: JSON.stringify({ message: "Password hashed successfully" })
    };

    return response;
}