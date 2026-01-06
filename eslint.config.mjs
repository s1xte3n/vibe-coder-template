import js from '@eslint/js';
import globals from 'globals';
import prettierPlugin from 'eslint-plugin-prettier';

// Extract Prettier rules
import prettierConfig from 'eslint-config-prettier';

// Prettier rules object
const prettierRules = prettierConfig.rules || {};

export default [
  js.configs.recommended,

  {
    files: ['**/*.js', '**/*.mjs'],
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      globals: {
        ...globals.node,
      },
    },
    plugins: {
      prettier: prettierPlugin,
    },
    rules: {
      ...prettierRules, // Apply Prettier rules
      'prettier/prettier': 'error', // Formatting errors become ESLint errors

      /* Code quality */
      'no-unused-vars': ['warn', { argsIgnorePattern: '^_' }],
      'no-console': 'off',

      /* Safety */
      eqeqeq: ['error', 'always'],
      'no-var': 'error',
      'prefer-const': 'error',

      /* Readability */
      curly: ['error', 'all'],
    },
  },
];
