function note
	set fpath $HOME/steve.log
	set argv_1 "$argv[1]"
	if test "$argv_1" != "edit"
		__print_log_header $fpath
	end
	vim $fpath
	__store_backup $fpath
end

function __print_log_header -a fpath -d 'Prints the log entry header to the log file'
	echo '' >> $fpath
	echo '# Author'\t':' (id -F) >> $fpath
	echo '# Audit ID '\t':' (id -u) >> $fpath
	__print_date $fpath
	return
end

function __print_date -a fpath -d 'Print the current date and time to the log file'
	echo '#' >> $fpath
	echo '# Date'\t\t':' (date "+%F %T") >> $fpath
	echo '# Subject'\t': <No Subject Line>' >> $fpath
	echo '-----------------' >> $fpath
	return
end

function __store_backup -a fpath -d 'Makes a backup of the log file'
	set bak_path $HOME/tmp/note/bak.log
	touch $bak_path
	cp $fpath $bak_path	
	
end
