package Database;

import java.sql.*;

public class JDBC {

    /*
    * !!!IMPORTANT!!!
    * H2 driver must be up to date and installed into project structure
    * */

    private Connection connection;

    public void connect() {
        System.out.print("Connecting...");
//        encrypted
        String password = "XV=&zWuBktuW^7$k-zVLdquSaua_YKa+9xqQ@kKtVkXN^9v?aTSyqxCJHs3tjy&N=8JADE-?ueSH+VpySeM=C6+!L!_p8DM6MyqXgLqT!k?!d=wx@xgs%p8LSqUswvw3J+q^LBG+Mcxn6C3k2GNU!?y=QPmQDwz@FgLWq%&v+f+bXPYE+?KkbNsRKgfKwY!nsb3cGrEWv$AzLYWPb!nt7m_ECXTN%?-NScEx#zGxrqU^-xq5P$?LeTFabPTqh$MvzWT$U#&^n5u6%mD3YhJSkwnP&3U@7dNUQ+_bkcSsspVfNjzDDQsFJX+92-_8jfCY7-?4$B$!AC4D^nTf5s8#kh%Sy99TSU^24JczgK@w^eNX9-t!T%uCQK#hQfkt=JuHBJDmp48$ZgQ5Ks7q=LFN!_dkG7K=L3fuepX#!!PTW4Zjs@5aSQcLgNyWLFk%_g8hmGV!JU$hn9UWuE^cbB^ef^pmVTQS+VyP2#YeW^Ph+xnkKmc=Wyen2#SVNJLNLSpAh24v37Yp+zt@Kbhx6U22Q8SRBAZXp^7a+LuHqFwH^J5pJ!bcY^K4DT=q4gvJLjftY@da4Q7yS7t6atgd97UUFEqW8_9wvzy7!?2uhkb#Lw_FFg=QZ8%2FfNHTSt-r9mj3Aw@YV$4x_D!$QZXYrHj+^@F@4pFJ^FSDQC=EhE=w%@R=6QNCMpsfzphAzTbgpU@2jj4B8ZJ7_rh4PFa^+BSCdh4NpsFBx@%-!L&W?=ddh=SvTVyVuKaBD?44?j@&@bXemuBdEC$2E&FVSqKa$kTkvp=h-YdVZMY4y-N5B%fJT3KvSbse_L_zzJu%qsw?nQUeY^H8feXX=JvCGJqAXJ-#deW95PQL2^nxEzQdccs+rCmmz?dkvM6Tf&%eWPR-zqUaEe=j@gsE8!VgNDZX2TD_hAeDCY?c?WXg5cSMCrCG8sMCqm+#-4saGPXp^sMjKHrH@XWNA@x-Mh2@vVRDk@%XBW2-rZyKS8sEaE6pSD62DjZuCt@Ev6fh9hdUswf@fCyK+tc3M@W#VfwyD-pKpnsZnq2EAnjSxrUX8edBbR6WLRk69mrE@pM#QgYL3jj-$+%4zVGc%NwBR+#cySZh_Xy#XbhR_s=hAGFE66k_yYJPu5A&kdP8MFX9uJXh5gY@nqqpG9CL%V8U97Xf8V5?8k%CFmvPWKF2yyRcsfP4XnnhEU@=PEb@GRgy&kc2$3k#PMcEB&tPB8yQvXsbZ9Rts7gR4+JdK!D99_B2vpnpe553&6NSvanjgAzqRNVc?KEWPBTzF@$c!B!krhfbaMFgan42Vf+m@NE_G-3M-MAuGzG3sw4RkqGX#y_Sv4LA+G3ZJjhhFyjfg?=9?j5R6TXgv%UJjz^dTZZ^VZ?RcP?RrDvj5N%Z@h_9d=QxJ=VkySA4v6kR$yYdtkVBWywDRFLG-xbNhsw45Qj@AP$H=ZD+CJ5sUDhH?F9+?evXnmRM-6TaZSGL%xNY4QEn4Vf7CzTavdh##9QD#9Z$TJF_uEt%&5P3*=HVYM96GM^Yq_w&sGGP-HJWbyuZ^eQS3zgRZcXzRpqTy=gmrKaCPduqB@YFA&t3w#KW82G=Knu_D4+f56?5p9M7n$qP&N3szd^sQU#g-z!@WC#CaW_5us9!FgzgG9q&TgYWX+z$qasDhDX&TEpK^B?kb_kp2C2Zg#ca?ae-43R3nTwP-JWe4#_tN7dDGwTSwFsuY6pUFG*_Nc94x2Pry$se7Ys4s^hzxs^B9_emT4M?f$rA6ydzpznrz5uehzJ?TBCw%s%#ychh5we6=7wUK=8p!qM_r7BDy=ap?KZQ?V+%s$sPx-YSKA9qzVh!yYxz3g*aPwEF^2JWa#+6da6C^=X3a+83%J+Y%Krmh=PHTtRrWvj96Q95B-WSDzaL#6=m2puf?dPHv?@F_kajQW84e#@vpTfkrs=54EbpbmLSUc5$?QwZsbZs+kyf9UHcXje-!z8eY4VckBvH&TA$NPHUXup@Cv^#&FZzPGZ-XShHqA3xV+c#!D6=Krr";
        try {
//            creates connection with mainDB
            connection = DriverManager.getConnection("jdbc:h2:~/MainDB", "Admin", password);
            System.out.print("OK!" + "\n");
        } catch (SQLException e) {
            System.out.println("Critical Error: Connection to MainDB has failed:");
            e.printStackTrace();
        }
    }

    public void createStatement(String query) {
        Statement statement = null;
        System.out.print("Creating statement...");
        try {
//            create statement
            statement = connection.createStatement();
            System.out.print("OK!" + "\n");
        } catch (SQLException throwables) {
            System.out.println("Critical Error: Could not create statement:");
            throwables.printStackTrace();
        }
        System.out.print("Executing statement...");
        try {
//            statement must not be null
            assert statement != null;
//            execute the query
            statement.executeQuery(query);
            System.out.print("OK!" + "\n");
        } catch (SQLException throwables) {
            System.out.println("Error: Could not execute query. Please check query:");
            throwables.printStackTrace();
        }
    }

    public ResultSet getResultSet(String query) {
        Statement statement = null;
        ResultSet resultSet = null;
        System.out.print("Creating statement...");
        try {
//            create statement
            statement = connection.createStatement();
            System.out.println("OK!" + "\n");
        } catch (SQLException throwables) {
            System.out.println("Error: Could not create statement:");
            throwables.printStackTrace();
        }
        System.out.print("Executing statement...");
        try {
//            statement must not be null
            assert statement != null;
//            returns results
            resultSet = statement.executeQuery(query);
            System.out.print("OK!" + "\n");
        } catch (SQLException throwables) {
            System.out.println("Error: Could not execute statement:");
            throwables.printStackTrace();
        }
        return resultSet;
    }

    public void closeConnection() {
        System.out.print("Closing connection...");
        try {
//            closes connection to mainDB. This is necessary for access from other modules
            connection.close();
            System.out.print("OK!" + "\n");
        } catch (SQLException e) {
            System.out.println("Error: Not able to close connection.");
            e.printStackTrace();
        }
    }
}
