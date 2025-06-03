import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        try {
            FileReader file = new FileReader("chess.txt");

            ChessLexer lexer = new ChessLexer(file);
            ChessParser parser = new ChessParser(lexer);

            parser.parse();

            System.out.println("Análise concluída com sucesso.");
        } catch (Exception e) {
            System.err.println("Erro durante a análise:");
            e.printStackTrace();
        }
    }
}
