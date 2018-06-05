//
//  ModelController.swift
//  Testing
//
//  Created by Olivia Corrodi on 6/2/18.
//  Copyright © 2018 Olivia Corrodi. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {
    
    var pageData: [Topic] = []
    var names: [String] = ["Improper Integrals", "Slope Fields", "Area Between Two Curves", "Graph Identification", "Euler's Method", "Related Rates", "Area of Polar Graphs", "Optimization", "Arc Length", "TBD"]
    
    
    override init() {
        super.init()
        let a = Topic(name: "Improper Integrals", problems: ["integralc.png":"C","int2a.png":"A"], hints: ["1. Usually R ends up in the denominator such that the term goes to zero","2. If the limit is an indeterminate form, use L'Hopital's Rule"], notes: "Finding the area under a curve that continues to infinity or negative infinity" + "\n" + "Rewrite the integral with a limit as R goes to infinity and change the top bound of the integral to R" + "\n" +
            "Solve the integral" + "\n" +
            "Take the limit of the resulting expression", image: "integral.png", answers: ["imp1.jpg","int2.jpg"])
        
        let b = Topic(name: "Slope Fields", problems: ["slopec.png":"C", "slopee.png":"E"], hints: ["1. Use process of elimination with multiple choice", "2. Plug in values from each quadrant as test values"], notes: "Determining the equation based on a slope field." + "\n" +
            "Look at where the slope on the slope field is positive/negative and steeper/less steep areas." + "\n" +
            "Using that information, correctly identify the differential equation", image: "x-sqslopefield.gif", answers: ["slopes2.png","slopes3.png"])
        
        let c = Topic(name: "Area Between Two Curves", problems: ["areac.png":"C", "areac2.png":"C"], hints: ["1. If the graphs are left/right of eachother, integrate with y values, otherwise use x values","2. If you have to do a u-sub, make sure to change the bounds"], notes: "Finding the area between two functions that intersect at points x = a, b" + "\n" +
            "Determine which function is greater" + "\n" +
            "Find the intersection points" + "\n" +
            "Write an integral of the larger function minus the smaller from a to b" + "\n" +
            "Solve", image: "areanew.png", answers: ["area2.jpg","area1.jpg"])
        
        let d = Topic(name: "Graph Identification", problems: ["graphb.png":"B", "graphb2.png":"B"], hints: ["1. Use process of elimination for multiple choice","2. It is easiest to only compare two graphs at one time, even if there are 3"], notes: "Determining which graph matches which derivative." + "\n" +
            "When f’(x) is positive, f(x) is is increasing" + "\n" +
            "When f’’(x) is positive, f(x) is concave up and f’(x) is increasing" + "\n" +
            "Where f’(x) crosses the x-axis (critical point), f(x) has a minimum or maximum" + "\n" +
            "Where f’’(x) crosses the x-axis (point of inflection), f(x) changes from concave up to concave down and f’(x) has a minimum or maximum", image: "graph.png", answers: ["graph2.jpg","graph1.jpg"])
        
        let e = Topic(name: "Euler's Method", problems: ["eulerq1.png":"D", "eulerd.png":"C"], hints: ["1. Plug in the previous x/y values to get the current x/y value", "2. If they only give you f(x), remember to differentiate to get f'(x) before using the formula"], notes: "Approximating a solution to a differential equation that is not able to be solve" + "\n" +
            "Y = y-value of initial condition" + "\n" +
            "h = step size" + "\n" +
            "F(x) = antiderivative of f’(x), or f(x)" + "\n" +
            "(x,y) = initial condition" + "\n" +
            "An initial condition (a point on f(x))", image: "Eulers-Method-Formula.png", answers: ["euler3.jpg","euler1.jpg"])
        
        let f = Topic(name: "Related Rates", problems: ["ratesc.png":"C", "ratese.png":"E"], hints: ["1. Watch out for a hidden step which may involve finding another value using other equations", "2. Remember to use implicit differentiation"], notes: "Finding a rate at which a quantity changes by relating that quantity to other quantities whose rates of change are known (usually with respect to time)" + "\n" +
            "1.Sketch" + "\n" +
            "2.List the givens and find" + "\n" +
            "3.Write an equation that relates all the variables" + "\n" +
            "4.Differentiate" + "\n" +
            "5.Solve for the find", image: "relatedrates.png", answers: ["rates1.jpg","rates2.jpg"])
        
        let g = Topic(name: "Area of Polar Graphs", problems: ["polarq1c.png":"C", "polarq2c.png":"C"], hints: ["1. Sometimes it's easier to find the area of half of a symmetric graph then double it", "2. If not given bounds, find the zeros of the function"], notes: "Finding the area inside a polar curve from angle α to angle β" + "\n" +
            "If there is only one graph, use the period of the function for the bounds, otherwise use the two intersection points." + "\n" +
            "With multiple functions, subtract the square of one radius from the other in order to desired region." + "\n" +
            "Solve the integral!", image: "polar.png", answers: ["polar2.jpg","polar1.jpg"])
        
        let h = Topic(name: "Optimization", problems: ["optc.png":"C", "optb.png":"B"], hints: ["1. Be sure to answer the question with the value they ask for", "2. Plug constants in before differentiating the equation"], notes: "Finding the largest value smallest value that a function can have (usually applied to real-life situations)" + "\n" +
            "1.Sketch" + "\n" +
            "2.Write an equation for the function that needs to be maximized or minimized" + "\n" +
            "3.Differentiate and find the critical points" + "\n" +
            "4.Plug x-values of the critical points into the original to determine the maximum or minimum" + "\n" +
            "5.Answer the question (what was asked to maximize or minimize?",image:"can.png", answers: ["opt.jpg","opt1.jpg"])
        
        let i = Topic(name: "Arc Length", problems: ["arclengthq1d.png":"D", "arcc.png":"C"], hints: ["1. If you are not given a calculator, look to factor inside of the radical", "2. If given parametric equations, use (x'(t)^2 + (y'(t))^2 under the radical or divide dy/dt by dx/dt to get dy/dx"], notes: "Determining the length of a curve from a to b." + "\n" +
            "a and b are the bounds of the curve" + "\n" +
            "dy/dx is the derivative of the function" + "\n" +
            "Plug values into the formula", image: "eq0016P.gif", answers: ["arc2.jpg","arc1.jpg"])
        
        let j = Topic(name: "Area of Shells", problems: ["shellsb.png":"B","shellse.png":"E"], hints: ["1. Use the shell method when a function is rotated about the y-axis but difficult to express as a function of y.", "2. Think of the shell method as finding infinite cylinders with the x as the radius and the function f(x) as the height."], notes: "Calculating the volume of a revolved solid using 'shells'" + "\n" + "r = length of the shell (x)" + "\n" +
            "h = height of the shell (f(x))" + "\n" +
            "Multiply x by f(x)" + "\n" +
            "Integrate this expression from x = a to b" + "\n" +
            "Multiply by 2π", image: "shells.png", answers: ["shells3.jpg","shells2.jpg"])
        pageData = [a,b,c,d,e,f,g,h,i,j]
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        dataViewController.index = index
        return dataViewController
    }
    
    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return names.index(of: viewController.dataObject.name) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
}

