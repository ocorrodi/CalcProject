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
        let a = Topic(name: "Improper Integrals", problems: ["integralc.png":"C","improperintegralq1.png":"C"], hints: [], notes: "Finding the area under a curve that continues to infinity or negative infinity" + "\n" + "Rewrite the integral with a limit as R goes to infinity and change the top bound of the integral to R" + "\n" +
            "Solve the integral" + "\n" +
            "Take the limit of the resulting expression", image: "integral.png")
        
        let b = Topic(name: "Slope Fields", problems: ["slopec.png":"C", "slopee.png":"E"], hints: [], notes: "Determining the equation based on a slope field." + "\n" +
            "Look at where the slope on the slope field is positive/negative and steeper/less steep areas." + "\n" +
            "Using that information, correctly identify the differential equation", image: "x-sqslopefield.gif")
        
        let c = Topic(name: "Area Between Two Curves", problems: ["areac.png":"C", "areac2.png":"C"], hints: [], notes: "Finding the area between two functions" + "\n" +
            "a and b are the two intersection points" + "\n" +
            "f(x) is greater than g(x)" + "\n" +
            "Plug into the integral and solve!", image: "area.png")
        
        let d = Topic(name: "Graph Identification", problems: ["graphb.png":"B", "graphb2.png":"B"], hints: [], notes: "Determining which graph matches which derivative." + "\n" +
            "When f’(x) is positive, f(x) is is increasing" + "\n" +
            "When f’’(x) is positive, f(x) is concave up and f’(x) is increasing" + "\n" +
            "Where f’(x) crosses the x-axis (critical point), f(x) has a minimum or maximum" + "\n" +
            "Where f’’(x) crosses the x-axis (point of inflection), f(x) changes from concave up to concave down and f’(x) has a minimum or maximum", image: "graph.png")
        
        let e = Topic(name: "Euler's Method", problems: ["eulerq1.png":"D", "eulerd.png":"D"], hints: [], notes: "Approximating a solution to a differential equation that is not able to be solve" + "\n" +
            "Y = y-value of initial condition" + "\n" +
            "h = step size" + "\n" +
            "F(x) = antiderivative of f’(x), or f(x)" + "\n" +
            "(x,y) = initial condition" + "\n" +
            "An initial condition (a point on f(x))", image: "Eulers-Method-Formula.png")
        
        let f = Topic(name: "Related Rates", problems: ["ratesc.png":"C", "ratese.png":"E"], hints: [], notes: "Finding a rate at which a quantity changes by relating that quantity to other quantities whose rates of change are known (usually with respect to time)" + "\n" +
            "1.Sketch" + "\n" +
            "2.List the givens and find" + "\n" +
            "3.Write an equation that relates all the variables" + "\n" +
            "4.Differentiate" + "\n" +
            "5.Solve for the find", image: "relatedrates.png")
        
        let g = Topic(name: "Area of Polar Graphs", problems: ["polarq1c.png":"C", "polarq2c.png":"C"], hints: [], notes: "Finding the area inside a polar curve from angle α to angle β" + "\n" +
            "If there is only one graph, use the period of the function for the bounds, otherwise use the two intersection points." + "\n" +
            "With multiple functions, subtract the square of one radius from the other in order to desired region." + "\n" +
            "Solve the integral!", image: "polar.png")
        
        let h = Topic(name: "Optimization", problems: ["optc.png":"C", "optb.png":"B"], hints: [], notes: "Finding the largest value smallest value that a function can have (usually applied to real-life situations)" + "\n" +
            "1.Sketch" + "\n" +
            "2.Write an equation for the function that needs to be maximized or minimized" + "\n" +
            "3.Differentiate and find the critical points" + "\n" +
            "4.Plug x-values of the critical points into the original to determine the maximum or minimum" + "\n" +
            "5.Answer the question (what was asked to maximize or minimize?",image:"")
        
        let i = Topic(name: "Arc Length", problems: ["arclengthq1d.png":"D", "arc2a.png":"A"], hints: [], notes: "Determining the length of a curve from a to b." + "\n" +
            "a and b are the bounds of the curve" + "\n" +
            "dy/dx is the derivative of the function" + "\n" +
            "Plug values into the formula", image: "eq0016P.gif")
        
        let j = Topic(name: "TBD", problems: [:], hints: [], notes: "", image: "")
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

