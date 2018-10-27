# [YARS](https://www.researchgate.net/profile/Dominik_Tomaszuk/publication/309695477_RDF_Data_in_Property_Graph_Model/links/59ddd535458515f6ef0712d3/RDF-Data-in-Property-Graph-Model.pdf) grammar for [ANTLR v4](https://github.com/antlr/antlr4)

Based on [ANTLR grammars-v4 project](https://github.com/antlr/grammars-v4).

## Testing grammar
1. Go to the antlr directory:

```shell
cd yars
```

2. Run tests on files in ``yars/examples``:

```shell
mvn clean test
```

Grammar is currently under development. Therefore, ``yars/examples`` contain partial examples that do not show all structures YARS structures, but correspond to the current state of grammar. More extensive examples of YARS are available in ``yars/next-examples``.

## Contribution
Would you like to improve this project? Great! We are waiting for your help and suggestions. If you are new in open source contributions, read [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/).

## License
Distributed under [BSD license](https://github.com/lszeremeta/antlr-yars/blob/master/LICENSE).
