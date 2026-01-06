import js from "@eslint/js";

export default [
  js.configs.recommended,

  {
    files: ["**/*.js", "**/*.mjs"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module"
    },
    rules: {
      /* Code quality */
      "no-unused-vars": ["warn", { argsIgnorePattern: "^_" }],
      "no-console": "off",

      /* Safety */
      "eqeqeq": ["error", "always"],
      "no-var": "error",
      "prefer-const": "error",

      /* Readability */
      "curly": ["error", "all"]
    }
  }
];
