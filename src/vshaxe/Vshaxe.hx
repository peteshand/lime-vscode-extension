package vshaxe;

import vscode.Disposable;
import vshaxe.DisplayArgumentsProvider;

/**
	Public API provided by the vshaxe extension.

	Retrieve with vscode extensions API: `var vshaxe:Vshaxe = Vscode.extensions.getExtension("nadako.vshaxe").exports`
**/
typedef Vshaxe = {
	/**
		Register a display argument provider.

		Display arguments are passed to the Haxe Language Server for completion and used for the dependency explorer.

		An extension should only register a provider if it handles the current workspace's project type
		(usually when a matching project file is present, e.g. a `project.xml` for Lime projects).
		In the case of two competing providers, the user is prompted to select between them.

		@param name A unique ID to identify the extension. No two providers with the same name can be registered.
		@param provider A display argument provider.
		@return A disposable which unregisters the provider.
	**/
	function registerDisplayArgumentsProvider(name:String, provider:DisplayArgumentsProvider):Disposable;

	/**
		Parse contents of a hxml file into an array of Haxe command-line arguments.

		Skips comments and unquotes arguments.

		An extension can use this if it has to work with framework-generated hxml files that need to be used
		for providing display arguments.
	**/
	function parseHxmlToArguments(hxml:String):Array<String>;
}