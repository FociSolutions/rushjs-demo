module.exports = {
    parserOptions: {
        tsconfigRootDir: __dirname,
        ecmaVersion: 2021,
        project: ['./tsconfig.json']
    },
    ignorePatterns: [
        '*.js', '*.ts'
    ]
};