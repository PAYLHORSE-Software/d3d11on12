AT_COMPILE_TIME :: true;

PREFIXES_FOR_TYPES_TO_OMIT :: string.[
    "__REQUIRED_",
    "LP",
    "IID_",
    "__MIDL_",
];

#if AT_COMPILE_TIME {
    #run,stallable {
        set_build_options_dc(.{do_output=false});
        root_options := get_build_options();
        args := root_options.compile_time_command_line;
        if !generate_bindings(args) {
            compiler_set_workspace_status(.FAILED);
        }
    }
} else {
    #import "System";

    main :: () {

        set_working_directory(path_strip_filename(get_path_of_running_executable()));
        args := get_command_line_arguments();
        if !generate_bindings(args) {
            exit(1);
        }
    }
}

generate_bindings :: (args: [] string) -> bool {

    opts: Generate_Bindings_Options;
    {
        using opts;

	array_add(*libnames, "d3d11on12.dll");

	array_add(*source_files, "d3d11on12.h");

        array_add(*path_fragments_to_treat_as_non_system_paths, "d3d11on12.h");
	
        array_add(*extra_clang_arguments, "-x", "c++", "-DWIN32_LEAN_AND_MEAN");
        log_unsupported = true;

        // Any extra code to include before or after the generated code.
        header = HEADER;
        footer = FOOTER;

        visitor = d3d11on12_visitor;
    }

    return generate_bindings(opts, "raw_bindings.jai");
}

d3d11on12_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if !parent_decl {
        for PREFIXES_FOR_TYPES_TO_OMIT {
            if begins_with(decl.name, it) {
                decl.decl_flags |= .OMIT_FROM_OUTPUT;
                return .STOP;
            }
        }
    }

    return .RECURSE;
}

#scope_file

#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "File";
#import "String";

// DECLARATIONS_TO_OMIT :: string.[
// ];

HEADER :: #string DONE
//  --------------------
// | D3D11ON12 BINDINGS |
//  --------------------

// NOTE: if you're updating this module, copy over to module.jai and use d3d11 namespace similarly
DONE

FOOTER :: #string DONE
DONE
