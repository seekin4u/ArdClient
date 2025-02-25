Haven Resource 1H src �  Ochs.java /* Preprocessed source code */
/* $use: ui/croster */

package haven.res.gfx.hud.rosters.cow;

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class Ochs extends Entry {
    public int meat, milk;
    public int meatq, milkq, hideq;
    public int seedq;
    public boolean bull, calf, dead, pregnant, lactate, owned, mine;

    public Ochs(long id, String name) {
	super(SIZE, id, name);
    }

    public void draw(GOut g) {
	drawbg(g);
	int i = 0;
	drawcol(g, CowRoster.cols.get(i), 0, this, namerend, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, bull, sex, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, calf, growth, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, dead, deadrend, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, pregnant, pregrend, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, lactate, lactrend, i++);
	drawcol(g, CowRoster.cols.get(i), 0.5, (owned ? 1 : 0) | (mine ? 2 : 0), ownrend, i++);
	drawcol(g, CowRoster.cols.get(i), 1, q, quality, i++);
	drawcol(g, CowRoster.cols.get(i), 1, meat, null, i++);
	drawcol(g, CowRoster.cols.get(i), 1, milk, null, i++);
	drawcol(g, CowRoster.cols.get(i), 1, meatq, percent, i++);
	drawcol(g, CowRoster.cols.get(i), 1, milkq, percent, i++);
	drawcol(g, CowRoster.cols.get(i), 1, hideq, percent, i++);
	drawcol(g, CowRoster.cols.get(i), 1, seedq, null, i++);
	super.draw(g);
    }

    public boolean mousedown(Coord c, int button) {
	if(CowRoster.cols.get(1).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.bull == this.bull));
	    return(true);
	}
	if(CowRoster.cols.get(2).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.calf == this.calf));
	    return(true);
	}
	if(CowRoster.cols.get(3).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.dead == this.dead));
	    return(true);
	}
	if(CowRoster.cols.get(4).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.pregnant == this.pregnant));
	    return(true);
	}
	if(CowRoster.cols.get(5).hasx(c.x)) {
	    markall(Ochs.class, o -> (o.lactate == this.lactate));
	    return(true);
	}
	if(CowRoster.cols.get(6).hasx(c.x)) {
	    markall(Ochs.class, o -> ((o.owned == this.owned) && (o.mine == this.mine)));
	    return(true);
	}
	return(super.mousedown(c, button));
    }
}

/* >wdg: CowRoster */
src �  CowRoster.java /* Preprocessed source code */
/* $use: ui/croster */

package haven.res.gfx.hud.rosters.cow;

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class CowRoster extends CattleRoster<Ochs> {
    public static List<Column> cols = initcols(
	new Column<Entry>("Name", Comparator.comparing((Entry e) -> e.name), 200),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/sex", 2),      Comparator.comparing((Ochs e) -> e.bull).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/growth", 2),   Comparator.comparing((Ochs e) -> e.calf).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/deadp", 3),    Comparator.comparing((Ochs e) -> e.dead).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/pregnant", 2), Comparator.comparing((Ochs e) -> e.pregnant).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/lactate", 1),  Comparator.comparing((Ochs e) -> e.lactate).reversed(), 20).runon(),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/owned", 1),    Comparator.comparing((Ochs e) -> ((e.owned ? 1 : 0) | (e.mine ? 2 : 0))).reversed(), 20),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/quality", 2), Comparator.comparing((Ochs e) -> e.q).reversed()),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/meatquantity", 1), Comparator.comparing((Ochs e) -> e.meat).reversed()),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/milkquantity", 1), Comparator.comparing((Ochs e) -> e.milk).reversed()),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/meatquality", 1), Comparator.comparing((Ochs e) -> e.meatq).reversed()),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/milkquality", 1), Comparator.comparing((Ochs e) -> e.milkq).reversed()),
	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/hidequality", 1), Comparator.comparing((Ochs e) -> e.hideq).reversed()),

	new Column<Ochs>(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/breedingquality", 1), Comparator.comparing((Ochs e) -> e.seedq).reversed())
    );
    protected List<Column> cols() {return(cols);}

    public static CattleRoster mkwidget(UI ui, Object... args) {
	return(new CowRoster());
    }

    public Ochs parse(Object... args) {
	int n = 0;
	long id = (Long)args[n++];
	String name = (String)args[n++];
	Ochs ret = new Ochs(id, name);
	ret.grp = (Integer)args[n++];
	int fl = (Integer)args[n++];
	ret.bull = (fl & 1) != 0;
	ret.calf = (fl & 2) != 0;
	ret.dead = (fl & 4) != 0;
	ret.pregnant = (fl & 8) != 0;
	ret.lactate = (fl & 16) != 0;
	ret.owned = (fl & 32) != 0;
	ret.mine = (fl & 64) != 0;
	ret.q = ((Number)args[n++]).doubleValue();
	ret.meat = (Integer)args[n++];
	ret.milk = (Integer)args[n++];
	ret.meatq = (Integer)args[n++];
	ret.milkq = (Integer)args[n++];
	ret.hideq = (Integer)args[n++];
	ret.seedq = (Integer)args[n++];
	return(ret);
    }

    public TypeButton button() {
	return(typebtn(Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/btn-cow", 2),
		       Resource.classres(CowRoster.class).pool.load("gfx/hud/rosters/btn-cow-d", 2)));
    }
}
code �  haven.res.gfx.hud.rosters.cow.Ochs ����   4 �	 ' U
 0 V
 ' W	 X Y Z [ \	 ' ]
 ' ^?�      	 ' _
 ` a	 ' b	 ' c	 ' d	 ' e	 ' f	 ' g	 ' h	 ' i	 ' j	 ' k	 ' l
 m n	 ' o	 ' p
 q r	 ' s	 ' t	 ' u	 ' v	 ' w	 ' x	 ' y	 ' z
 0 {	 | }
  ~    �
 ' �  �  �  �  �  �
 0 � � meat I milk meatq milkq hideq seedq bull Z calf dead pregnant lactate owned mine <init> (JLjava/lang/String;)V Code LineNumberTable draw (Lhaven/GOut;)V StackMapTable  � \ 	mousedown (Lhaven/Coord;I)Z lambda$mousedown$5 '(Lhaven/res/gfx/hud/rosters/cow/Ochs;)Z lambda$mousedown$4 lambda$mousedown$3 lambda$mousedown$2 lambda$mousedown$1 lambda$mousedown$0 
SourceFile 	Ochs.java � � @ � � E � � � � � � haven/res/ui/croster/Column � � � � 8 9 � � � � � : 9 � � ; 9 � � < 9 � � = 9 � � > 9 ? 9 � � � � � � � � � � � � 1 2 3 2 4 2 � � 5 2 6 2 7 2 D E � � 2 � � "haven/res/gfx/hud/rosters/cow/Ochs BootstrapMethods � � � M � � � � � � � � � J K haven/res/ui/croster/Entry 
haven/GOut SIZE Lhaven/Coord; #(Lhaven/Coord;JLjava/lang/String;)V drawbg 'haven/res/gfx/hud/rosters/cow/CowRoster cols Ljava/util/List; java/util/List get (I)Ljava/lang/Object; namerend Ljava/util/function/Function; drawcol ](Lhaven/GOut;Lhaven/res/ui/croster/Column;DLjava/lang/Object;Ljava/util/function/Function;I)V java/lang/Boolean valueOf (Z)Ljava/lang/Boolean; sex growth deadrend pregrend lactrend java/lang/Integer (I)Ljava/lang/Integer; ownrend q D java/lang/Double (D)Ljava/lang/Double; quality percent haven/Coord x hasx (I)Z
 � � (Ljava/lang/Object;)Z
 ' � test D(Lhaven/res/gfx/hud/rosters/cow/Ochs;)Ljava/util/function/Predicate; markall 2(Ljava/lang/Class;Ljava/util/function/Predicate;)V
 ' �
 ' �
 ' �
 ' �
 ' � � � � R M Q M P M O M N M L M "java/lang/invoke/LambdaMetafactory metafactory � Lookup InnerClasses �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 	cow.cjava ! ' 0     1 2    3 2    4 2    5 2    6 2    7 2    8 9    : 9    ; 9    < 9    = 9    > 9    ? 9   	  @ A  B   &     
*� -� �    C   
     	   D E  B  �    �*+� =*+� �  � *� �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � *� � � �� � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �  �� *+� �  � *� !� �  �� *+� �  � *� "� �  �� *+� �  � *� #� �� *+� $�    F   f � �  G H  G H I�    G H  G H I� 
  G H  G H I�    G H  G H I C   J         !  C  e  �  �  �  " @ ^  ~ !� "� #� $� %  J K  B  N     � �  � +� %� &� *'*� (  � )�� �  � +� %� &� *'*� *  � )�� �  � +� %� &� *'*� +  � )�� �  � +� %� &� *'*� ,  � )�� �  � +� %� &� *'*� -  � )�� �  � +� %� &� *'*� .  � )�*+� /�    F    $####$ C   N    (  ) " * $ , : - F . H 0 ^ 1 j 2 l 4 � 5 � 6 � 8 � 9 � : � < � = � > � @ L M  B   ?     +� *� � +� *� � � �    F    @ C       = N M  B   4     +� *� � � �    F    @ C       9 O M  B   4     +� *� � � �    F    @ C       5 P M  B   4     +� *� � � �    F    @ C       1 Q M  B   4     +� *� � � �    F    @ C       - R M  B   4     +� *� � � �    F    @ C       )  �   >  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � S    � �   
  � � � code �  haven.res.gfx.hud.rosters.cow.CowRoster ����   4;
 L y	  z {
  y |
  } ~ 
  � �
 
 �	  �	  �	  �	  �	  �	  �	  �	  � �
  �	  �	  �	  �	  �	  �	  �	  �
 � �	 � � �
 � � �
  �
  �
 
 �
 � �
 � �	 � � � �   � � �
 ( � �  � � �
 ( �
 ( � �  � �  � �  � �  � �  � �  �
 ( � �  � � 	 � � 
 � �  � �  � �  �
  � � cols Ljava/util/List; 	Signature /Ljava/util/List<Lhaven/res/ui/croster/Column;>; <init> ()V Code LineNumberTable ()Ljava/util/List; 1()Ljava/util/List<Lhaven/res/ui/croster/Column;>; mkwidget B(Lhaven/UI;[Ljava/lang/Object;)Lhaven/res/ui/croster/CattleRoster; parse 9([Ljava/lang/Object;)Lhaven/res/gfx/hud/rosters/cow/Ochs; StackMapTable { � ~  button #()Lhaven/res/ui/croster/TypeButton; 1([Ljava/lang/Object;)Lhaven/res/ui/croster/Entry; lambda$static$13 9(Lhaven/res/gfx/hud/rosters/cow/Ochs;)Ljava/lang/Integer; lambda$static$12 lambda$static$11 lambda$static$10 lambda$static$9 lambda$static$8 lambda$static$7 8(Lhaven/res/gfx/hud/rosters/cow/Ochs;)Ljava/lang/Double; lambda$static$6 lambda$static$5 9(Lhaven/res/gfx/hud/rosters/cow/Ochs;)Ljava/lang/Boolean; lambda$static$4 lambda$static$3 lambda$static$2 lambda$static$1 lambda$static$0 0(Lhaven/res/ui/croster/Entry;)Ljava/lang/String; <clinit> ILhaven/res/ui/croster/CattleRoster<Lhaven/res/gfx/hud/rosters/cow/Ochs;>; 
SourceFile CowRoster.java Q R M N 'haven/res/gfx/hud/rosters/cow/CowRoster java/lang/Long � � java/lang/String "haven/res/gfx/hud/rosters/cow/Ochs Q � java/lang/Integer � � � � � � � � � � � � � � � � � � java/lang/Number � � � � � � � � � � � � � � � � � � � � � gfx/hud/rosters/btn-cow � � � gfx/hud/rosters/btn-cow-d � � Y Z � � � � � � � �  haven/res/ui/croster/Column Name BootstrapMethods t	
 Q gfx/hud/rosters/sex n Q gfx/hud/rosters/growth gfx/hud/rosters/deadp gfx/hud/rosters/pregnant gfx/hud/rosters/lactate gfx/hud/rosters/owned d gfx/hud/rosters/quality k Q gfx/hud/rosters/meatquantity gfx/hud/rosters/milkquantity gfx/hud/rosters/meatquality gfx/hud/rosters/milkquality gfx/hud/rosters/hidequality gfx/hud/rosters/breedingquality  !haven/res/ui/croster/CattleRoster [Ljava/lang/Object; 	longValue ()J (JLjava/lang/String;)V intValue ()I grp I bull Z calf dead pregnant lactate owned mine doubleValue ()D q D meat milk meatq milkq hideq seedq haven/Resource classres #(Ljava/lang/Class;)Lhaven/Resource; pool Pool InnerClasses Lhaven/Resource$Pool; haven/Resource$Pool load! Named +(Ljava/lang/String;I)Lhaven/Resource$Named; typebtn =(Lhaven/Indir;Lhaven/Indir;)Lhaven/res/ui/croster/TypeButton; valueOf (I)Ljava/lang/Integer; java/lang/Double (D)Ljava/lang/Double; java/lang/Boolean (Z)Ljava/lang/Boolean; haven/res/ui/croster/Entry name Ljava/lang/String;
"# &(Ljava/lang/Object;)Ljava/lang/Object;
 $ apply ()Ljava/util/function/Function; java/util/Comparator 	comparing 5(Ljava/util/function/Function;)Ljava/util/Comparator; ,(Ljava/lang/String;Ljava/util/Comparator;I)V
 % reversed ()Ljava/util/Comparator; '(Lhaven/Indir;Ljava/util/Comparator;I)V runon ()Lhaven/res/ui/croster/Column;
 &
 '
 (
 )
 *
 + &(Lhaven/Indir;Ljava/util/Comparator;)V
 ,
 -
 .
 /
 0
 1 initcols 0([Lhaven/res/ui/croster/Column;)Ljava/util/List; haven/Resource$Named236 s t r n q n p n o n m n l d j k i d h d g d f d e d c d "java/lang/invoke/LambdaMetafactory metafactory8 Lookup �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;9 %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles 	cow.cjava !  L    	 M N  O    P   Q R  S        *� �    T       E  M U  S        � �    T       [ O    V � W X  S         � Y� �    T       ^ � Y Z  S  �    :=+�2� � B+�2� :� Y!� 	:+�2� 
� � +�2� 
� 6~� � � ~� � � ~� � � ~� � � ~� � �  ~� � � @~� � � +�2� � � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � �    [   � � R  \ ] ^ _  _�    \ ] ^ _  _O _�    \ ] ^ _  _O _�    \ ] ^ _  _P _�    \ ] ^ _  _P _�    \ ] ^ _  _P _�    \ ] ^ _  _P _�    \ ] ^ _  _ T   V    b  c  d  e & f 7 g E h V i g j x k � l � m � n � o � p � q � r s t& u7 v  ` a  S   @      � � �  � � !�  � "�    T       z  {  zA Y b  S        *+� #�    T       E
 c d  S         *� � $�    T       Y
 e d  S         *� � $�    T       W
 f d  S         *� � $�    T       V
 g d  S         *� � $�    T       U
 h d  S         *� � $�    T       S
 i d  S         *� � $�    T       R
 j k  S         *� � %�    T       P
 l d  S   N     *� � � *� � � �� $�    [    @J�    _  T       N
 m n  S         *� � &�    T       M
 o n  S         *� � &�    T       L
 p n  S         *� � &�    T       K
 q n  S         *� � &�    T       J
 r n  S         *� � &�    T       I
 s t  S        *� '�    T       G  u R  S  {     '� (Y� (Y)� *  � + ȷ ,SY� (Y� � -�  � .  � +� / � 0� 1SY� (Y� � 2�  � 3  � +� / � 0� 1SY� (Y� � 4�  � 5  � +� / � 0� 1SY� (Y� � 6�  � 7  � +� / � 0� 1SY� (Y� � 8�  � 9  � +� / � 0� 1SY� (Y� � :�  � ;  � +� / � 0SY� (Y� � <�  � =  � +� / � >SY� (Y� � ?�  � @  � +� / � >SY	� (Y� � A�  � B  � +� / � >SY
� (Y� � C�  � D  � +� / � >SY� (Y� � E�  � F  � +� / � >SY� (Y� � G�  � H  � +� / � >SY� (Y� � I�  � J  � +� / � >S� K� �    T   B    F  G $ I N J x K � L � M � N PE Rk S� U� V� W Y  F  �   �  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � w   : O    v �     � � � 	 � � �	475 codeentry >   wdg haven.res.gfx.hud.rosters.cow.CowRoster   ui/croster H  