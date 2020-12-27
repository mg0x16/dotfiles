__prompt_component_path_render() {
	local cwd="${(%):-%~}"
	local directoryPath=$(dirname $cwd)
	local directoryName=$(basename $cwd)
	local collapsedDirectoryPath=$(echo $directoryPath | sed -e "s;\(/..\)[^/]*;\1;g")

	if [ $directoryPath = '.' ] || ([ $directoryPath = '/' ] && [ $directoryName = '/' ]); then
		local result=$directoryName
	elif [ $directoryPath = '/' ]; then
		local result="/$directoryName"
	else
		local result="$collapsedDirectoryPath/$directoryName"
	fi

	local colored_result=$(echo $result | sed -e "s;\([~|/]\);%B%F{blue}\1%f%b;g")

  echo -n "$colored_result "
}