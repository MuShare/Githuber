//
//  RepositoryItem.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

class RepositoryItem: Codable {
    let fullName: String?
    let language: String?
    let description: String?
    let owner: Owner
    let name: String?
    let stargazersCount: Int?
    let forksCount: Int?
    let watchersCount: Int?
    let openIssuesCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case language
        case description
        case owner
        case name
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case watchersCount = "watchers_count"
    }
    
    public init(fullName: String?, language: String?, description: String?, owner: Owner, name: String?, stargazersCount: Int?, forksCount: Int?, watchersCount: Int?, openIssuesCount: Int?) {
        self.fullName = fullName
        self.language = language
        self.description = description
        self.owner = owner
        self.name = name
        self.stargazersCount = stargazersCount
        self.forksCount = forksCount
        self.watchersCount = watchersCount
        self.openIssuesCount = openIssuesCount
    }
}

extension RepositoryItem {
    private static let colorMap: [String: UInt32] = [
        "Mercury": 0xff2b2b,
        "TypeScript": 0x2b7489,
        "PureBasic": 0x5a6986,
        "Objective-C++": 0x6866fb,
        "Self": 0x0579aa,
        "edn": 0xdb5855,
        "NewLisp": 0x87AED7,
        "Jupyter Notebook": 0xDA5B0B,
        "Rebol": 0x358a5b,
        "Frege": 0x00cafe,
        "Dart": 0x00B4AB,
        "AspectJ": 0xa957b0,
        "Shell": 0x89e051,
        "Web Ontology Language": 0x9cc9dd,
        "xBase": 0x403a40,
        "Eiffel": 0x946d57,
        "Nix": 0x7e7eff,
        "RAML": 0x77d9fb,
        "MTML": 0xb7e1f4,
        "Racket": 0x22228f,
        "Elixir": 0x6e4a7e,
        "SAS": 0xB34936,
        "Agda": 0x315665,
        "wisp": 0x7582D1,
        "D": 0xba595e,
        "Kotlin": 0xF18E33,
        "Opal": 0xf7ede0,
        "Crystal": 0x776791,
        "Objective-C": 0x438eff,
        "ColdFusion CFC": 0xed2cd6,
        "Oz": 0xfab738,
        "Mirah": 0xc7a938,
        "Objective-J": 0xff0c5a,
        "Gosu": 0x82937f,
        "FreeMarker": 0x0050b2,
        "Ruby": 0x701516,
        "Component Pascal": 0xb0ce4e,
        "Arc": 0xaa2afe,
        "Brainfuck": 0x2F2530,
        "Nit": 0x009917,
        "APL": 0x5A8164,
        "Go": 0x375eab,
        "Visual Basic": 0x945db7,
        "PHP": 0x4F5D95,
        "Cirru": 0xccccff,
        "SQF": 0x3F3F3F,
        "Glyph": 0xe4cc98,
        "Java": 0xb07219,
        "MAXScript": 0x00a6a6,
        "Scala": 0xDC322F,
        "Makefile": 0x427819,
        "ColdFusion": 0xed2cd6,
        "Perl": 0x0298c3,
        "Lua": 0x000080,
        "Vue": 0x2c3e50,
        "Verilog": 0xb2b7f8,
        "Factor": 0x636746,
        "Haxe": 0xdf7900,
        "Pure Data": 0x91de79,
        "Forth": 0x341708,
        "Red": 0xee0000,
        "Hy": 0x7790B2,
        "Volt": 0x1F1F1F,
        "LSL": 0x3d9970,
        "eC": 0x913960,
        "CoffeeScript": 0x244776,
        "HTML": 0xe44b23,
        "Lex": 0xDBCA00,
        "API Blueprint": 0x2ACCA8,
        "Swift": 0xffac45,
        "C": 0x555555,
        "AutoHotkey": 0x6594b9,
        "Isabelle": 0xFEFE00,
        "Metal": 0x8f14e9,
        "Clarion": 0xdb901e,
        "JSONiq": 0x40d47e,
        "Boo": 0xd4bec1,
        "AutoIt": 0x1C3552,
        "Clojure": 0xdb5855,
        "Rust": 0xdea584,
        "Prolog": 0x74283c,
        "SourcePawn": 0x5c7611,
        "AMPL": 0xE6EFBB,
        "FORTRAN": 0x4d41b1,
        "ANTLR": 0x9DC3FF,
        "Harbour": 0x0e60e3,
        "Tcl": 0xe4cc98,
        "BlitzMax": 0xcd6400,
        "PigLatin": 0xfcd7de,
        "Lasso": 0x999999,
        "ECL": 0x8a1267,
        "VHDL": 0xadb2cb,
        "Elm": 0x60B5CC,
        "Propeller Spin": 0x7fa2a7,
        "X10": 0x4B6BEF,
        "IDL": 0xa3522f,
        "ATS": 0x1ac620,
        "Ada": 0x02f88c,
        "Unity3D Asset": 0xab69a1,
        "Nu": 0xc9df40,
        "LFE": 0x004200,
        "SuperCollider": 0x46390b,
        "Oxygene": 0xcdd0e3,
        "ASP": 0x6a40fd,
        "Assembly": 0x6E4C13,
        "Gnuplot": 0xf0a9f0,
        "JFlex": 0xDBCA00,
        "NetLinx": 0x0aa0ff,
        "Turing": 0x45f715,
        "Vala": 0xfbe5cd,
        "Processing": 0x0096D8,
        "Arduino": 0xbd79d1,
        "FLUX": 0x88ccff,
        "NetLogo": 0xff6375,
        "C Sharp": 0x178600,
        "CSS": 0x563d7c,
        "Emacs Lisp": 0xc065db,
        "Stan": 0xb2011d,
        "SaltStack": 0x646464,
        "QML": 0x44a51c,
        "Pike": 0x005390,
        "LOLCODE": 0xcc9900,
        "ooc": 0xb0b77e,
        "Handlebars": 0x01a9d6,
        "J": 0x9EEDFF,
        "Mask": 0xf97732,
        "EmberScript": 0xFFF4F3,
        "TeX": 0x3D6117,
        "Nemerle": 0x3d3c6e,
        "KRL": 0x28431f,
        "Ren'Py": 0xff7f7f,
        "Unified Parallel C": 0x4e3617,
        "Golo": 0x88562A,
        "Fancy": 0x7b9db4,
        "OCaml": 0x3be133,
        "Shen": 0x120F14,
        "Pascal": 0xb0ce4e,
        "F#": 0xb845fc,
        "Puppet": 0x302B6D,
        "ActionScript": 0x882B0F,
        "Diff": 0x88dddd,
        "Ragel in Ruby Host": 0x9d5200,
        "Fantom": 0xdbded5,
        "Zephir": 0x118f9e,
        "Click": 0xE4E6F3,
        "Smalltalk": 0x596706,
        "DM": 0x447265,
        "Ioke": 0x078193,
        "PogoScript": 0xd80074,
        "LiveScript": 0x499886,
        "JavaScript": 0xf1e05a,
        "VimL": 0x199f4b,
        "PureScript": 0x1D222D,
        "ABAP": 0xE8274B,
        "Matlab": 0xbb92ac,
        "Slash": 0x007eff,
        "R": 0x198ce7,
        "Erlang": 0xB83998,
        "Pan": 0xcc0000,
        "LookML": 0x652B81,
        "Eagle": 0x814C05,
        "Scheme": 0x1e4aec,
        "PLSQL": 0xdad8d8,
        "Python": 0x3572A5,
        "Max": 0xc4a79c,
        "Common Lisp": 0x3fb68b,
        "Latte": 0xA8FF97,
        "XQuery": 0x5232e7,
        "Omgrofl": 0xcabbff,
        "XC": 0x99DA07,
        "Nimrod": 0x37775b,
        "SystemVerilog": 0xDAE1C2,
        "Chapel": 0x8dc63f,
        "Groovy": 0xe69f56,
        "Dylan": 0x6c616e,
        "E": 0xccce35,
        "Parrot": 0xf3ca0a,
        "Grammatical Framework": 0x79aa7a,
        "Game Maker Language": 0x8fb200,
        "Papyrus": 0x6600cc,
        "NetLinx+ERB": 0x747faa,
        "Clean": 0x3F85AF,
        "Alloy": 0x64C800,
        "Squirrel": 0x800000,
        "PAWN": 0xdbb284,
        "UnrealScript": 0xa54c4d,
        "Standard ML": 0xdc566d,
        "Slim": 0xff8f77,
        "Perl6": 0x0000fb,
        "Julia": 0xa270ba,
        "Haskell": 0x29b544,
        "NCL": 0x28431f,
        "Io": 0xa9188d,
        "Rouge": 0xcc0088,
        "cpp": 0xf34b7d,
        "AGS Script": 0xB9D9FF,
        "Dogescript": 0xcca760,
        "nesC": 0x94B0C7
    ]
    
    var languageColor: UIColor {
        guard let language = language, let colorValue = RepositoryItem.colorMap[language] else {
            return .lightGray
        }
        return UIColor(hex: colorValue)
    }
}

extension RepositoryItem: Equatable {
    static func == (lhs: RepositoryItem, rhs: RepositoryItem) -> Bool {
        return lhs.fullName == rhs.fullName
            && lhs.language == rhs.language
            && lhs.description == rhs.description
            && lhs.owner == rhs.owner
            && lhs.name == rhs.name
            && lhs.stargazersCount == rhs.stargazersCount
            && lhs.forksCount == rhs.forksCount
            && lhs.watchersCount == rhs.watchersCount
            && lhs.openIssuesCount == rhs.openIssuesCount
    }
}
