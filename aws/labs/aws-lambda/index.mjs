import bcrypt from "bcryptjs";

export const handler = async (event) => {
    const { password } = JSON.parse(event.body || '{}');
    
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
        body: JSON.stringify("Hashed Password: " + hashedPassword)
    };

    return response;
}