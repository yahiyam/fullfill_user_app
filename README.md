# fullfill_user_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Instruction to Change API Key

To use this project, you need to replace the default API key with your own. Follow the steps below to update the API key:

1. Create a `.env` file in the root directory of the project. You can use the provided `.env.example` file as a template.

2. Open the `.env` file in a text editor.

3. Locate the line that starts with `PUBLISHABLE_KEY=`, `SECRET_KEY=` and replace `add_your_publishable_key`, `add_your_secret_key` respectively with your actual Stripe API key.

4. Save the `.env` file.

Make sure not to include the actual API key in the repository or share it publicly. The `.env` file is typically added to the project's `.gitignore` file to prevent it from being committed to version control.

Once you have updated the API key, you can proceed with the installation and usage of the project. If you encounter any issues or have further questions, refer to the project's documentation or reach out to the project maintainers.
