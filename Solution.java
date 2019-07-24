import java.util.ArrayList;
import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

import java.util.ArrayList;
import java.util.Scanner;

enum Color {
    RED, GREEN
}

abstract class Tree {

    private int value;
    private Color color;
    private int depth;

    public Tree(int value, Color color, int depth) {
        this.value = value;
        this.color = color;
        this.depth = depth;
    }

    public int getValue() {
        return value;
    }

    public Color getColor() {
        return color;
    }

    public int getDepth() {
        return depth;
    }

    public abstract void accept(TreeVis visitor);
}

class TreeNode extends Tree {

    private ArrayList<Tree> children = new ArrayList<>();

    public TreeNode(int value, Color color, int depth) {
        super(value, color, depth);
    }

    public void accept(TreeVis visitor) {
        visitor.visitNode(this);

        for (Tree child : children) {
            child.accept(visitor);
        }
    }

    public void addChild(Tree child) {
        children.add(child);
    }
}

class TreeLeaf extends Tree {

    public TreeLeaf(int value, Color color, int depth) {
        super(value, color, depth);
    }

    public void accept(TreeVis visitor) {
        visitor.visitLeaf(this);
    }
}

abstract class TreeVis
{
    public abstract int getResult();
    public abstract void visitNode(TreeNode node);
    public abstract void visitLeaf(TreeLeaf leaf);

}

class SumInLeavesVisitor extends TreeVis {
    private int result;
    
    public int getResult() {
        return result;
    }

    public void visitNode(TreeNode node) {
    }

    public void visitLeaf(TreeLeaf leaf) {
          result += leaf.getValue();
    }
}

class ProductOfRedNodesVisitor extends TreeVis {
    private long result = 1;
    private final int M = 1000000007;
              
    public int getResult() {
        return (int) result;
    }

    public void visitNode(TreeNode node) {
          if(node.getColor().equals(Color.RED)) {
              result = (result * node.getValue()) % M;
          }
    }

    public void visitLeaf(TreeLeaf leaf) {
          if(leaf.getColor().equals(Color.RED)) {
              result = (result * leaf.getValue()) % M;
          }
    }
}

class FancyVisitor extends TreeVis {
    private int evenDepthNonLeavesSum = 0;
    private int greenLeavesSum = 0;
    
    public int getResult() {
          return Math.abs(evenDepthNonLeavesSum - greenLeavesSum);
    }

    public void visitNode(TreeNode node) {
        if(node.getDepth() % 2 == 0) {
            evenDepthNonLeavesSum += node.getValue();
        }
    }

    public void visitLeaf(TreeLeaf leaf) {
        if(leaf.getColor().equals(Color.GREEN)){
            greenLeavesSum += leaf.getValue();
        }
    }
}

public class Solution {
  
    private static int nodeValues[];
    private static Color nodeColors[];
    private static HashMap<Integer, Set<Integer>> treeSimulate = new HashMap<>();
        
    public static Tree solve() {
        
        //read the tree from STDIN and return its root as a return value of this function
        Scanner scan = new Scanner(System.in);
        int n = scan.nextInt();
        
        nodeValues = new int[n];
        nodeColors = new Color[n];

        // set value array for node
        for(int i=0; i<n; i++){
            nodeValues[i] = scan.nextInt();
        }
        
        // set color array for node
        for(int i=0; i<n; i++){
            nodeColors[i] = (scan.nextInt() == 0) ? Color.RED : Color.GREEN;
        }
        
        // initilize the root node 
        TreeNode rootnode = new TreeNode(nodeValues[0], nodeColors[0], 0);
        
        // read edge pairs and set them into treeSimulate ArrayList
        for(int i=0; i<n-1; i++){
            
            int u = scan.nextInt();
            int v = scan.nextInt();
            
            Set<Integer> uEdges = treeSimulate.get(u);
            if(uEdges == null){uEdges = new HashSet<Integer>();}
            uEdges.add(v);
            treeSimulate.put(u, uEdges);
            
            Set<Integer> vEdges = treeSimulate.get(v);
            if(vEdges == null) {vEdges = new HashSet<>();}
            vEdges.add(u);
            treeSimulate.put(v, vEdges);
        }
        
        // After treeSimulate ArrayList has finished, we are going to generate the 
        Set<Integer> rootEdges = treeSimulate.get(1);
        Iterator<Integer> rootEdgesIterator = rootEdges.iterator();
        while(rootEdgesIterator.hasNext()){
            Integer x = rootEdgesIterator.next();
            treeSimulate.get(x).remove(1);  // remove connection which is from child to parent.
            generateConnectNewNode(rootnode, x);
        }

        return rootnode;
    }

    // generate a new node(treeNode or treeLeaf and connect it to parentTree)
    private static void generateConnectNewNode(Tree parentNode, Integer childx){
        
        boolean hasChild = false;
        
        Set<Integer> childEdges = treeSimulate.get(childx);
        if(childEdges != null && !childEdges.isEmpty()) hasChild = true;
        
        if (hasChild){  // new a node Tree
            TreeNode tn = new TreeNode(nodeValues[childx-1], nodeColors[childx-1], parentNode.getDepth()+1);
            ((TreeNode) parentNode).addChild(tn);
            Iterator<Integer> childEdgeIterator = childEdges.iterator();
            while(childEdgeIterator.hasNext()){
                Integer grandChild = childEdgeIterator.next();
                treeSimulate.get(grandChild).remove(childx); // remove connection from child to parent. This remove is on simulate tree.
                generateConnectNewNode(tn, grandChild);
            }
        } else {                //if(!hasChild)
            // new a Leaf Tree and connect to parent
            TreeLeaf tl = new TreeLeaf(nodeValues[childx-1], nodeColors[childx-1], parentNode.getDepth()+1);
            ((TreeNode) parentNode).addChild(tl);
        }
        
    }


    public static void main(String[] args) {
      	Tree root = solve();
		SumInLeavesVisitor vis1 = new SumInLeavesVisitor();
      	ProductOfRedNodesVisitor vis2 = new ProductOfRedNodesVisitor();
      	FancyVisitor vis3 = new FancyVisitor();

      	root.accept(vis1);
      	root.accept(vis2);
      	root.accept(vis3);

      	int res1 = vis1.getResult();
      	int res2 = vis2.getResult();
      	int res3 = vis3.getResult();

      	System.out.println(res1);
     	System.out.println(res2);
    	System.out.println(res3);
	}
}
