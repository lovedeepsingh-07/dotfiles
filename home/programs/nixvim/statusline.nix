{ ... }: {
  programs.nixvim.extraConfigLua =
    "	function GetGitBranch() \n		local in_git_repo = vim.fn.system(\"git rev-parse --is-inside-work-tree 2>/dev/null\") == \"true\\n\"\n		if in_git_repo then\n			local branch = vim.fn.systemlist(\"git branch --show-current\")[1]\n			return branch ~= nil and \" \" .. branch or \"\"\n		else\n			return \"\"\n		end\n	end\n\n	vim.o.statusline = [[ %t %{v:lua.GetGitBranch()} %m %= [%l,%c] ]] -- Statusline string\n";
}
